Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE826400C0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:57:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zws-0002lh-DV; Fri, 02 Dec 2022 01:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1p0zwo-0002h1-8D
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:54:58 -0500
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1p0zwm-0003xo-Eq
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669964096; x=1701500096;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YikgxWHkjXBdW36x0bhe9MX4hxGxON7eQ2q2fKy1Od4=;
 b=dMllgx2pTJOqSAp/cKNAgYboL6nMJhh+olQp5SDmG1nDZMFw/FRZpu4e
 B9SZ5/63Jps1qTXEhaYtIoKDobd3m9TsyF/ZDaAgndXBSWVC+RfqJiXhb
 /1AHkfakZuVVW+ZrHMlTKkNxcnYsbH5A9Q+mYSYrQ6Ll78eKaDohRuGcm
 4KjIdeRgRrbH5biQY1vrZjxqAa9L0vP2W+9kzEpGbYlLW6NZHmsPE9Jq+
 /Hu0+PTyiQVRKqQCDhmcxfHpz3sR6eYQCdzyy5eTLeA58YvCYw0kB6wL7
 AlRMueGgNN1vvmAAOHPaRnZ5NKUePuPPMOarvZ5pVmmkZnwuZrCUMsWAB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="342820204"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="342820204"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 22:54:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="733710089"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="733710089"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2022 22:54:29 -0800
Message-ID: <c7971c8ad3b4683e2b3036dd7524af1cb42e50e1.camel@linux.intel.com>
Subject: Re: [PATCH v3 2/3] KVM: keep track of running ioctls
From: Robert Hoo <robert.hu@linux.intel.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>, kvm@vger.kernel.org, David Hildenbrand
 <david@redhat.com>
Date: Fri, 02 Dec 2022 14:54:28 +0800
In-Reply-To: <20221111154758.1372674-3-eesposit@redhat.com>
References: <20221111154758.1372674-1-eesposit@redhat.com>
 <20221111154758.1372674-3-eesposit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=robert.hu@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 2022-11-11 at 10:47 -0500, Emanuele Giuseppe Esposito wrote:
> Using the new accel-blocker API, mark where ioctls are being called
> in KVM. Next, we will implement the critical section that will take
> care of performing memslots modifications atomically, therefore
> preventing any new ioctl from running and allowing the running ones
> to finish.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f99b0becd8..ff660fd469 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2310,6 +2310,7 @@ static int kvm_init(MachineState *ms)
>      assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size());
>  
>      s->sigmask_len = 8;
> +    accel_blocker_init();
>  
>  #ifdef KVM_CAP_SET_GUEST_DEBUG
>      QTAILQ_INIT(&s->kvm_sw_breakpoints);
> @@ -3014,7 +3015,9 @@ int kvm_vm_ioctl(KVMState *s, int type, ...)
>      va_end(ap);
>  
>      trace_kvm_vm_ioctl(type, arg);
> +    accel_ioctl_begin();
>      ret = ioctl(s->vmfd, type, arg);
> +    accel_ioctl_end();
>      if (ret == -1) {
>          ret = -errno;
>      }
> @@ -3032,7 +3035,9 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type,
> ...)
>      va_end(ap);
>  
>      trace_kvm_vcpu_ioctl(cpu->cpu_index, type, arg);
> +    accel_cpu_ioctl_begin(cpu);

Does this mean that kvm_region_commit() can inhibit any other vcpus
doing any ioctls?

>      ret = ioctl(cpu->kvm_fd, type, arg);
> +    accel_cpu_ioctl_end(cpu);
>      if (ret == -1) {
>          ret = -errno;
>      }
> @@ -3050,7 +3055,9 @@ int kvm_device_ioctl(int fd, int type, ...)
>      va_end(ap);
>  
>      trace_kvm_device_ioctl(fd, type, arg);
> +    accel_ioctl_begin();
>      ret = ioctl(fd, type, arg);
> +    accel_ioctl_end();
>      if (ret == -1) {
>          ret = -errno;
>      }


