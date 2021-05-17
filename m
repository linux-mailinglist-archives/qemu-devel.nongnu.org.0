Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1C5382DA7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:41:37 +0200 (CEST)
Received: from localhost ([::1]:38066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lidV2-000378-HV
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1lidTq-0002Dp-OG
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:40:22 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56326 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1lidTl-0000Nw-Gy
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:40:22 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx3+83cqJgW24YAA--.3738S3;
 Mon, 17 May 2021 21:40:08 +0800 (CST)
Subject: Re: [PATCH] include/qemu/bswap.h: using atomic memory load/store for
 word access
To: Peter Maydell <peter.maydell@linaro.org>
References: <1621220021-17199-1-git-send-email-maobibo@loongson.cn>
 <CAFEAcA_MbNm0QEtnAegW3uCpuvgTymUx7=depcxhqbpTkuEm8g@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <1f94fb8f-ee03-f800-ed24-13ee6e1d8157@loongson.cn>
Date: Mon, 17 May 2021 21:40:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MbNm0QEtnAegW3uCpuvgTymUx7=depcxhqbpTkuEm8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx3+83cqJgW24YAA--.3738S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4Duw17JFy5XF13Jw4UXFb_yoW7Jr1xpF
 Z0kw4Ykw48Ary29FZ7WF1rtw13Z397XFy3Gry5u34fGrW5GFn2vFWIkryrZr13Cr1kCryj
 ya1UW345WF4DZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvjb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxkI
 ecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUgg
 _TUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PMM,

Thanks for kindly response.

I reply inline.

在 2021年05月17日 17:23, Peter Maydell 写道:
> On Mon, 17 May 2021 at 03:54, Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> virtio ring buffer has lockless ring buffer scheme. When guest vcpu
>> reads the memory, qemu io thread may is writing the same address.
>> It requiires atomic operation in qemu side, __builtin_memcpy may
>> read byte-by-byte.
>>
>> This patch uses fix this, however it may bring negative performance
>> effect on system which does not support hw aligned memory access.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>  /*
>> - * Any compiler worth its salt will turn these memcpy into native unaligned
>> - * operations.  Thus we don't need to play games with packed attributes, or
>> - * inline byte-by-byte stores.
>> - * Some compilation environments (eg some fortify-source implementations)
>> - * may intercept memcpy() in a way that defeats the compiler optimization,
>> - * though, so we use __builtin_memcpy() to give ourselves the best chance
>> - * of good performance.
>> + * Some driver using lockless ring buffer like virtio ring requires that
>> + * it should be atomic, since guest vcpu thread is reading the memory.
>> + * It may bring out negative performance effect for architectures which
>> + * do not support hw memory aligned access like mips, if ptr is not word
>> + * alignment.
>>   */
>>
>>  static inline int lduw_he_p(const void *ptr)
>>  {
>> -    uint16_t r;
>> -    __builtin_memcpy(&r, ptr, sizeof(r));
>> -    return r;
>> +    return *(uint16_t *)ptr;
> 
> We rely on these functions handling unaligned pointers, as
> the comment you delete notes. This change will not merely
> "bring negative performance effect", it will cause crashes
> on hosts like SPARC.
> 
> (Your change makes these functions have undefined behaviour in C,
> which is why it will cause crashes on some systems.)
oops, maybe anothe extra APIs with atomic function is better.
> 
> We do need to add support in various bits of the memory subsystem
> for "this really does have to be atomic" (notably so that we can
> do atomic read-modify-write actions when doing page table walks),
> but that has to be done by adding extra APIs as necessary. And in
> some places we already *have* those functions.
> 
> Can you describe the problem you're trying to solve in greater
> detail? Notably:
>  * what are the stacktraces for the accesses that end up in these
>    functions ? (ie what is the top level function call or set of
>    function calls that need to have must-be-atomic variants?)
>  * can we guarantee that the pointers really are aligned there?
When running virtio network stress test cases on my MIPS kvm guest,
network will lost after hours.

The reason is that when threads in guestOS is reading vring descriptor
in linux virtio driver with file drivers/virtio/virtio_ring.c:
static bool virtqueue_poll_split(struct virtqueue *_vq, unsigned last_used_idx)
{
        struct vring_virtqueue *vq = to_vvq(_vq);

        return (u16)last_used_idx != virtio16_to_cpu(_vq->vdev,
                        vq->split.vring.used->idx);
}


And the same time qemu iothread in host is updating idx, it is in qemu
file hw/virtio/virtio.c:
static inline void vring_used_idx_set(VirtQueue *vq, uint16_t val)
{
    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
    hwaddr pa = offsetof(VRingUsed, idx);

    if (caches) {
        virtio_stw_phys_cached(vq->vdev, &caches->used, pa, val);
        address_space_cache_invalidate(&caches->used, pa, sizeof(val));
    }

    vq->used_idx = val;
}
And here is function call trace in qemu side:
	stw_he_p()
	stw_le_p()
	address_space_stw_le_cached()
	stw_le_phys_cached()
	virtio_stw_phys_cached ()
static inline void stw_he_p(void *ptr, uint16_t v)
{
    __builtin_memcpy(ptr, &v, sizeof(v));
}

in linux kernel side, it is reading with half-word directly, however in
qemu side it may writing the same buffer byte-by-byte. it will bring out
problem in guest virtio driver.


By spec in https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html#x1-430008
the pointer is aligned with half-word. Here is piece of code in linux/include/uapi/linux/virtio_ring.h

/* The standard layout for the ring is a continuous chunk of memory which looks
 * like this.  We assume num is a power of 2.
 *
 * struct vring
 * {
 *      // The actual descriptors (16 bytes each)
 *      struct vring_desc desc[num];
 *
 *      // A ring of available descriptor heads with free-running index.
 *      __virtio16 avail_flags;
 *      __virtio16 avail_idx;
 *      __virtio16 available[num];
 *      __virtio16 used_event_idx;
 *
 *      // Padding to the next align boundary.
 *      char pad[];
 *
 *      // A ring of used descriptor heads with free-running index.
 *      __virtio16 used_flags;
 *      __virtio16 used_idx;
 *      struct vring_used_elem used[num];
 *      __virtio16 avail_event_idx;
 * };
 */

> 
> thanks
> -- PMM
> 


