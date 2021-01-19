Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5222E2FC39C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 23:39:02 +0100 (CET)
Received: from localhost ([::1]:45754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1zeO-000739-Sm
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 17:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>)
 id 1l1zd4-0006Nj-1b; Tue, 19 Jan 2021 17:37:38 -0500
Received: from ma1-aaemail-dr-lapp03.apple.com ([17.171.2.72]:56764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>)
 id 1l1zd2-0008Cd-6f; Tue, 19 Jan 2021 17:37:37 -0500
Received: from pps.filterd (ma1-aaemail-dr-lapp03.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp03.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 10JMYBQB013423; Tue, 19 Jan 2021 14:37:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=20180706;
 bh=2FgkfLvoDDb70XHz5HCw878PFhZtYBJkkql75UFnRHA=;
 b=crWskos5CZq/Zv/ovSV8joozbIktobJXmy1hDUGLPZUX4Aq1LTeyDzVm+gKBZagK6oZe
 dEhjnEPI+86CzpRuPBd98uNqUkQn80qRyjZDEfy+CZK4qXyY76V3/4Lo/NPRd+C7qc6k
 3jWMDZHALyTgh22ShCJtGGk+WGbnGuZ1sFBH39Lrf/2oaSRZacQVWp2ELkl8me+/XxGT
 lRVbtQPcmxg4TwiYMejjyBPhdkNSHt/nof8Q5T2Az7J3k77dynIUmQ7YSlNjmIOFsvC5
 iqZCR0rjErakSrrl0NjEy9miF52E8aVkuMZuHw4jWvaomB6aE4G1oiI2fuXfuFIfq7Cg JA== 
Received: from rn-mailsvcp-mta-lapp02.rno.apple.com
 (rn-mailsvcp-mta-lapp02.rno.apple.com [10.225.203.150])
 by ma1-aaemail-dr-lapp03.apple.com with ESMTP id 36400yre6s-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 19 Jan 2021 14:37:32 -0800
Received: from rn-mailsvcp-mmp-lapp02.rno.apple.com
 (rn-mailsvcp-mmp-lapp02.rno.apple.com [17.179.253.15])
 by rn-mailsvcp-mta-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.7.20201203 64bit (built Dec  3
 2020)) with ESMTPS id <0QN700MTPDIIAP80@rn-mailsvcp-mta-lapp02.rno.apple.com>; 
 Tue, 19 Jan 2021 14:37:30 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp02.rno.apple.com by
 rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.7.20201203 64bit (built Dec  3
 2020)) id <0QN700O00D533P00@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Tue,
 19 Jan 2021 14:37:30 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 5b0672c2549ae520efd66c97de4cf04f
X-Va-E-CD: f760d96413f0b4536494aff6c0bb6555
X-Va-R-CD: c1f7a5576fab44d40d7b6f9c6fc03739
X-Va-CD: 0
X-Va-ID: 8000a056-2d47-4bc4-9161-3f87ae3a5afb
X-V-A: 
X-V-T-CD: 5b0672c2549ae520efd66c97de4cf04f
X-V-E-CD: f760d96413f0b4536494aff6c0bb6555
X-V-R-CD: c1f7a5576fab44d40d7b6f9c6fc03739
X-V-CD: 0
X-V-ID: fb087c1b-d5d0-45c3-9b6b-6e5b56d5c2d7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_12:2021-01-18,
 2021-01-19 signatures=0
Received: from smtpclient.apple (unknown [17.232.231.32])
 by rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.7.20201203 64bit (built Dec  3
 2020))
 with ESMTPSA id <0QN700CLFDIFKX00@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Tue,
 19 Jan 2021 14:37:29 -0800 (PST)
Content-type: text/plain; charset=us-ascii
MIME-version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.6\))
Subject: Re: [PATCH v2] target/i386/hvf: add vmware-cpuid-freq cpu feature
In-reply-to: <20210114194703.134333-1-yaroshchuk2000@gmail.com>
Date: Tue, 19 Jan 2021 14:37:27 -0800
Content-transfer-encoding: quoted-printable
Message-id: <B529CEBA-F2F4-4EF4-8E59-F166158BBE0A@apple.com>
References: <20210113205221.32308-1-yaroshchuk2000@gmail.com>
 <20210114194703.134333-1-yaroshchuk2000@gmail.com>
To: yaroshchuk2000@gmail.com
X-Mailer: Apple Mail (2.3654.80.0.2.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_12:2021-01-18,
 2021-01-19 signatures=0
Received-SPF: pass client-ip=17.171.2.72; envelope-from=dirty@apple.com;
 helo=ma1-aaemail-dr-lapp03.apple.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, r.bolshakov@yadro.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Cameron Esfahani <dirty@apple.com>
From: dirty--- via <qemu-devel@nongnu.org>



> On Jan 14, 2021, at 11:47 AM, yaroshchuk2000@gmail.com wrote:
>=20
> From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>=20
> For `-accel hvf` cpu_x86_cpuid() is wrapped with hvf_cpu_x86_cpuid() =
to
> add paravirtualization cpuid leaf 0x40000010
> https://lkml.org/lkml/2008/10/1/246
>=20
> Leaf 0x40000010, Timing Information:
> EAX: (Virtual) TSC frequency in kHz.
> EBX: (Virtual) Bus (local apic timer) frequency in kHz.
> ECX, EDX: RESERVED (Per above, reserved fields are set to zero).
>=20
> On macOS TSC and APIC Bus frequencies can be readed by sysctl call =
with
> names `machdep.tsc.frequency` and `hw.busfrequency`
>=20
> This options is required for Darwin-XNU guest to be synchronized with
> host
>=20
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
> target/i386/hvf/hvf.c | 90 ++++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 89 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index ed9356565c..a5daafe202 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -65,6 +65,7 @@
>=20
> #include <Hypervisor/hv.h>
> #include <Hypervisor/hv_vmx.h>
> +#include <sys/sysctl.h>
>=20
> #include "exec/address-spaces.h"
> #include "hw/i386/apic_internal.h"
> @@ -456,6 +457,48 @@ static void dummy_signal(int sig)
> {
> }
>=20
> +static void init_tsc_freq(CPUX86State *env)
> +{
> +    size_t length;
> +    uint64_t tsc_freq;
> +
> +    if (env->tsc_khz !=3D 0) {
> +        return;
> +    }
> +
> +    length =3D sizeof(uint64_t);
> +    if (sysctlbyname("machdep.tsc.frequency", &tsc_freq, &length, =
NULL, 0)) {
> +        return;
> +    }
> +    env->tsc_khz =3D tsc_freq / 1000;  /* Hz to KHz */
> +}
> +
> +static void init_apic_bus_freq(CPUX86State *env)
> +{
> +    size_t length;
> +    uint64_t bus_freq;
> +
> +    if (env->apic_bus_freq !=3D 0) {
> +        return;
> +    }
> +
> +    length =3D sizeof(uint64_t);
> +    if (sysctlbyname("hw.busfrequency", &bus_freq, &length, NULL, 0)) =
{
> +        return;
> +    }
> +    env->apic_bus_freq =3D bus_freq;
> +}
> +
> +static inline bool tsc_is_known(CPUX86State *env)
> +{
> +    return env->tsc_khz !=3D 0;
> +}
> +
> +static inline bool apic_bus_freq_is_known(CPUX86State *env)
> +{
> +    return env->apic_bus_freq !=3D 0;
> +}
> +
> int hvf_init_vcpu(CPUState *cpu)
> {
>=20
> @@ -480,6 +523,15 @@ int hvf_init_vcpu(CPUState *cpu)
>     hvf_state->hvf_caps =3D g_new0(struct hvf_vcpu_caps, 1);
>     env->hvf_mmio_buf =3D g_new(char, 4096);
>=20
> +    if (x86cpu->vmware_cpuid_freq) {
> +        init_tsc_freq(env);
> +        init_apic_bus_freq(env);
> +
> +        if (!tsc_is_known(env) || !apic_bus_freq_is_known(env)) {
> +            error_report("vmware-cpuid-freq: feature couldn't be =
enabled");
> +        }
> +    }
> +
>     r =3D hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, =
HV_VCPU_DEFAULT);
>     cpu->vcpu_dirty =3D 1;
>     assert_hvf_ok(r);
> @@ -597,6 +649,42 @@ static void hvf_store_events(CPUState *cpu, =
uint32_t ins_len, uint64_t idtvec_in
>     }
> }
>=20

We already have hvf/x86_cpuid.c.  Can we put hvf_cpu_x86_cpuid() in =
there?

> +static void hvf_cpu_x86_cpuid(CPUX86State *env, uint32_t index, =
uint32_t count,
> +                              uint32_t *eax, uint32_t *ebx,
> +                              uint32_t *ecx, uint32_t *edx)
> +{
> +    /*
> +     * A wrapper extends cpu_x86_cpuid with 0x40000000 and 0x40000010 =
leafs
> +     * Provides vmware-cpuid-freq support to hvf
> +     */
> +
> +    uint32_t signature[3];
> +
> +    if (!tsc_is_known(env) || !apic_bus_freq_is_known(env)) {
> +        cpu_x86_cpuid(env, index, count, eax, ebx, ecx, edx);
> +        return;
> +    }
> +
> +    switch (index) {
> +    case 0x40000000:
> +        memcpy(signature, "TCGTCGTCGTCG", 12); /* QEMU Signature */

I agree with Roman, using "HVFHVFHVFHVF" is better.

> +        *eax =3D 0x40000010;                     /* Max available =
cpuid leaf */
> +        *ebx =3D signature[0];
> +        *ecx =3D signature[1];
> +        *edx =3D signature[2];
> +        break;
> +    case 0x40000010:
> +        *eax =3D env->tsc_khz;
> +        *ebx =3D env->apic_bus_freq / 1000; /* Hz to KHz */
> +        *ecx =3D 0;
> +        *edx =3D 0;
> +        break;
> +    default:
> +        cpu_x86_cpuid(env, index, count, eax, ebx, ecx, edx);
> +        break;
> +    }
> +}
> +
> int hvf_vcpu_exec(CPUState *cpu)
> {
>     X86CPU *x86_cpu =3D X86_CPU(cpu);
> @@ -734,7 +822,7 @@ int hvf_vcpu_exec(CPUState *cpu)
>             uint32_t rcx =3D (uint32_t)rreg(cpu->hvf_fd, HV_X86_RCX);
>             uint32_t rdx =3D (uint32_t)rreg(cpu->hvf_fd, HV_X86_RDX);
>=20
> -            cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
> +            hvf_cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
>=20
>             wreg(cpu->hvf_fd, HV_X86_RAX, rax);
>             wreg(cpu->hvf_fd, HV_X86_RBX, rbx);
> --=20
> 2.28.0
>=20
>=20

Looks good.

Cameron Esfahani
dirty@apple.com


