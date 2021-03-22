Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05C2343E61
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:51:43 +0100 (CET)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOI9u-0001VU-V5
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOI6Z-0007Ur-DF
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:48:15 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOI6U-0000Te-Bm
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:48:15 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F3rl00wBRz1BFLS;
 Mon, 22 Mar 2021 18:46:04 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Mar 2021 18:47:58 +0800
Subject: Re: [PATCH v5 02/10] KVM: Use a big lock to replace per-kml slots_lock
To: Peter Xu <peterx@redhat.com>, <qemu-devel@nongnu.org>
References: <20210310203301.194842-1-peterx@redhat.com>
 <20210310203301.194842-3-peterx@redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <71e85a52-7385-e88a-f51f-9371bc371d06@huawei.com>
Date: Mon, 22 Mar 2021 18:47:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210310203301.194842-3-peterx@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2021/3/11 4:32, Peter Xu wrote:
> Per-kml slots_lock will bring some trouble if we want to take all slots_lock of
> all the KMLs, especially when we're in a context that we could have taken some
> of the KML slots_lock, then we even need to figure out what we've taken and
> what we need to take.
> 
> Make this simple by merging all KML slots_lock into a single slots lock.
> 
> Per-kml slots_lock isn't anything that helpful anyway - so far only x86 has two
> address spaces (so, two slots_locks).  All the rest archs will be having one
> address space always, which means there's actually one slots_lock so it will be
> the same as before.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  accel/kvm/kvm-all.c      | 32 +++++++++++++++++---------------
>  include/sysemu/kvm_int.h |  2 --
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f88a52393fe..94e881f123b 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -174,8 +174,10 @@ typedef struct KVMResampleFd KVMResampleFd;
>  static QLIST_HEAD(, KVMResampleFd) kvm_resample_fd_list =
>      QLIST_HEAD_INITIALIZER(kvm_resample_fd_list);
>  
> -#define kvm_slots_lock(kml)      qemu_mutex_lock(&(kml)->slots_lock)
> -#define kvm_slots_unlock(kml)    qemu_mutex_unlock(&(kml)->slots_lock)
> +static QemuMutex kml_slots_lock;
> +
> +#define kvm_slots_lock()  qemu_mutex_lock(&kml_slots_lock)
> +#define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
nit: qemu_mutex_lock and qemu_mutex_unlock is not aligned.


>  
>  static inline void kvm_resample_fd_remove(int gsi)
>  {
> @@ -241,9 +243,9 @@ bool kvm_has_free_slot(MachineState *ms)
>      bool result;
>      KVMMemoryListener *kml = &s->memory_listener;
>  
> -    kvm_slots_lock(kml);
> +    kvm_slots_lock();
>      result = !!kvm_get_free_slot(kml);
> -    kvm_slots_unlock(kml);
> +    kvm_slots_unlock();
>  
>      return result;
>  }
> @@ -309,7 +311,7 @@ int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,
>      KVMMemoryListener *kml = &s->memory_listener;
>      int i, ret = 0;
>  
> -    kvm_slots_lock(kml);
> +    kvm_slots_lock();
>      for (i = 0; i < s->nr_slots; i++) {
>          KVMSlot *mem = &kml->slots[i];
>  
> @@ -319,7 +321,7 @@ int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,
>              break;
>          }
>      }
> -    kvm_slots_unlock(kml);
> +    kvm_slots_unlock();
>  
>      return ret;
>  }
> @@ -515,7 +517,7 @@ static int kvm_section_update_flags(KVMMemoryListener *kml,
>          return 0;
>      }
>  
> -    kvm_slots_lock(kml);
> +    kvm_slots_lock();
>  
>      while (size && !ret) {
>          slot_size = MIN(kvm_max_slot_size, size);
> @@ -531,7 +533,7 @@ static int kvm_section_update_flags(KVMMemoryListener *kml,
>      }
>  
>  out:
> -    kvm_slots_unlock(kml);
> +    kvm_slots_unlock();
>      return ret;
>  }
>  
> @@ -819,7 +821,7 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
>          return ret;
>      }
>  
> -    kvm_slots_lock(kml);
> +    kvm_slots_lock();
>  
>      for (i = 0; i < s->nr_slots; i++) {
>          mem = &kml->slots[i];
> @@ -845,7 +847,7 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
>          }
>      }
>  
> -    kvm_slots_unlock(kml);
> +    kvm_slots_unlock();
>  
>      return ret;
>  }
> @@ -1150,7 +1152,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
>      ram = memory_region_get_ram_ptr(mr) + section->offset_within_region +
>            (start_addr - section->offset_within_address_space);
>  
> -    kvm_slots_lock(kml);
> +    kvm_slots_lock();
>  
>      if (!add) {
>          do {
> @@ -1208,7 +1210,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
>      } while (size);
>  
>  out:
> -    kvm_slots_unlock(kml);
> +    kvm_slots_unlock();
>  }
>  
>  static void kvm_region_add(MemoryListener *listener,
> @@ -1235,9 +1237,9 @@ static void kvm_log_sync(MemoryListener *listener,
>      KVMMemoryListener *kml = container_of(listener, KVMMemoryListener, listener);
>      int r;
>  
> -    kvm_slots_lock(kml);
> +    kvm_slots_lock();
>      r = kvm_physical_sync_dirty_bitmap(kml, section);
> -    kvm_slots_unlock(kml);
> +    kvm_slots_unlock();
>      if (r < 0) {
>          abort();
>      }
> @@ -1337,7 +1339,7 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
>  {
>      int i;
>  
> -    qemu_mutex_init(&kml->slots_lock);
> +    qemu_mutex_init(&kml_slots_lock);
As you said, x86 has two address spaces, is it a problem that we may have multi initialization for kml_slots_lock?

Thanks,
Keqian

>      kml->slots = g_malloc0(s->nr_slots * sizeof(KVMSlot));
>      kml->as_id = as_id;
>  
> diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
> index ccb8869f01b..1da30e18841 100644
> --- a/include/sysemu/kvm_int.h
> +++ b/include/sysemu/kvm_int.h
> @@ -27,8 +27,6 @@ typedef struct KVMSlot
>  
>  typedef struct KVMMemoryListener {
>      MemoryListener listener;
> -    /* Protects the slots and all inside them */
> -    QemuMutex slots_lock;
>      KVMSlot *slots;
>      int as_id;
>  } KVMMemoryListener;
> 

