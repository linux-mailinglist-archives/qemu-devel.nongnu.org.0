Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF90D412EB6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 08:40:55 +0200 (CEST)
Received: from localhost ([::1]:54062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZSY-0004id-9x
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 02:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSZM6-0002JP-KV; Tue, 21 Sep 2021 02:34:14 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSZM3-0002xd-8b; Tue, 21 Sep 2021 02:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632206039;
 bh=A8uBCT6pEVvuvjWO8o3GM/qbi4ao3ZjwmzmzHHoYPAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gIAYOxvz4if32h8j7ybOGWXVQFHhwq60Vu6jqw5x08wdDfh+m88nCd/eAUhNlHcTg
 v0xNcLtWsKJ5rm46HC6E+myVi5agZxVOitE/hcW78Hz3pH/qvbA+nsGozy6vht/HFg
 uZB5eQrtbdGUowmbh/OBXCQU2LR30S1Nl9VIyH1I=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HDBTg2g7Qz9t0Y; Tue, 21 Sep 2021 16:33:59 +1000 (AEST)
Date: Tue, 21 Sep 2021 16:23:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH REBASED v5 1/2] spapr: nvdimm: Implement H_SCM_FLUSH hcall
Message-ID: <YUl6bnSuWVsX4P1I@yekko>
References: <162571302321.1030381.15196355582642786915.stgit@lep8c.aus.stglabs.ibm.com>
 <162571303048.1030381.13893352223345979621.stgit@lep8c.aus.stglabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sEy+QjDdyRzU+2cX"
Content-Disposition: inline
In-Reply-To: <162571303048.1030381.13893352223345979621.stgit@lep8c.aus.stglabs.ibm.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: nvdimm@lists.linux.dev, aneesh.kumar@linux.ibm.com, groug@kaod.org,
 kvm-ppc@vger.kernel.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 bharata@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--sEy+QjDdyRzU+2cX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 09:57:21PM -0500, Shivaprasad G Bhat wrote:
> The patch adds support for the SCM flush hcall for the nvdimm devices.
> To be available for exploitation by guest through the next patch.
>=20
> The hcall expects the semantics such that the flush to return
> with one of H_LONG_BUSY when the operation is expected to take longer
> time along with a continue_token. The hcall to be called again providing
> the continue_token to get the status. So, all fresh requests are put into
> a 'pending' list and flush worker is submitted to the thread pool. The
> thread pool completion callbacks move the requests to 'completed' list,
> which are cleaned up after reporting to guest in subsequent hcalls to
> get the status.
>=20
> The semantics makes it necessary to preserve the continue_tokens and
> their return status across migrations. So, the completed flush states
> are forwarded to the destination and the pending ones are restarted
> at the destination in post_load. The necessary nvdimm flush specific
> vmstate structures are added to the spapr machine vmstate.
>=20
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>  hw/ppc/spapr.c                |    6 +
>  hw/ppc/spapr_nvdimm.c         |  240 +++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/ppc/spapr.h        |   11 ++
>  include/hw/ppc/spapr_nvdimm.h |   13 ++
>  4 files changed, 269 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4dd90b75cc..546d825dde 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1622,6 +1622,8 @@ static void spapr_machine_reset(MachineState *machi=
ne)
>          spapr->ov5_cas =3D spapr_ovec_clone(spapr->ov5);
>      }
> =20
> +    spapr_nvdimm_finish_flushes(spapr);
> +
>      /* DRC reset may cause a device to be unplugged. This will cause tro=
ubles
>       * if this device is used by another device (eg, a running vhost bac=
kend
>       * will crash QEMU if the DIMM holding the vring goes away). To avoi=
d such
> @@ -2018,6 +2020,7 @@ static const VMStateDescription vmstate_spapr =3D {
>          &vmstate_spapr_cap_ccf_assist,
>          &vmstate_spapr_cap_fwnmi,
>          &vmstate_spapr_fwnmi,
> +        &vmstate_spapr_nvdimm_states,
>          NULL
>      }
>  };
> @@ -3014,6 +3017,9 @@ static void spapr_machine_init(MachineState *machin=
e)
>      }
> =20
>      qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
> +
> +    QLIST_INIT(&spapr->pending_flush_states);
> +    QLIST_INIT(&spapr->completed_flush_states);
>  }
> =20
>  #define DEFAULT_KVM_TYPE "auto"
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index 91de1052f2..4f8931ab15 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -22,6 +22,7 @@
>   * THE SOFTWARE.
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qapi/error.h"
>  #include "hw/ppc/spapr_drc.h"
>  #include "hw/ppc/spapr_nvdimm.h"
> @@ -30,6 +31,7 @@
>  #include "hw/ppc/fdt.h"
>  #include "qemu/range.h"
>  #include "hw/ppc/spapr_numa.h"
> +#include "block/thread-pool.h"
> =20
>  /* DIMM health bitmap bitmap indicators. Taken from kernel's papr_scm.c =
*/
>  /* SCM device is unable to persist memory contents */
> @@ -375,6 +377,243 @@ static target_ulong h_scm_bind_mem(PowerPCCPU *cpu,=
 SpaprMachineState *spapr,
>      return H_SUCCESS;
>  }
> =20
> +static uint64_t flush_token;

Better to put this in the machine state structure than a global.

> +static int flush_worker_cb(void *opaque)
> +{
> +    int ret =3D H_SUCCESS;
> +    SpaprNVDIMMDeviceFlushState *state =3D opaque;
> +
> +    /* flush raw backing image */
> +    if (qemu_fdatasync(state->backend_fd) < 0) {
> +        error_report("papr_scm: Could not sync nvdimm to backend file: %=
s",
> +                     strerror(errno));
> +        ret =3D H_HARDWARE;
> +    }
> +
> +    return ret;
> +}
> +
> +static void spapr_nvdimm_flush_completion_cb(void *opaque, int hcall_ret)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
> +    SpaprNVDIMMDeviceFlushState *state =3D opaque;
> +
> +    state->hcall_ret =3D hcall_ret;
> +    QLIST_REMOVE(state, node);
> +    QLIST_INSERT_HEAD(&spapr->completed_flush_states, state, node);
> +}
> +
> +static const VMStateDescription vmstate_spapr_nvdimm_flush_state =3D {
> +     .name =3D "spapr_nvdimm_flush_state",
> +     .version_id =3D 1,
> +     .minimum_version_id =3D 1,
> +     .fields =3D (VMStateField[]) {
> +         VMSTATE_UINT64(continue_token, SpaprNVDIMMDeviceFlushState),
> +         VMSTATE_INT64(hcall_ret, SpaprNVDIMMDeviceFlushState),
> +         VMSTATE_UINT32(drcidx, SpaprNVDIMMDeviceFlushState),
> +         VMSTATE_END_OF_LIST()
> +     },
> +};
> +
> +static bool spapr_nvdimm_states_needed(void *opaque)
> +{
> +     SpaprMachineState *spapr =3D (SpaprMachineState *)opaque;
> +
> +     return (!QLIST_EMPTY(&spapr->pending_flush_states) ||
> +             !QLIST_EMPTY(&spapr->completed_flush_states));
> +}
> +
> +static int spapr_nvdimm_post_load(void *opaque, int version_id)
> +{
> +    SpaprMachineState *spapr =3D (SpaprMachineState *)opaque;
> +    SpaprNVDIMMDeviceFlushState *state, *next;
> +    PCDIMMDevice *dimm;
> +    HostMemoryBackend *backend =3D NULL;
> +    ThreadPool *pool =3D aio_get_thread_pool(qemu_get_aio_context());
> +    SpaprDrc *drc;
> +
> +    QLIST_FOREACH_SAFE(state, &spapr->completed_flush_states, node, next=
) {

I don't think you need FOREACH_SAFE here.  You're not removing entries
=66rom the loop body.  If you're trying to protect against concurrent
removals, I don't think FOREACH_SAFE is sufficient, you'll need an
actual lock (but I think it's already protected by the BQL).

> +        if (flush_token < state->continue_token) {
> +            flush_token =3D state->continue_token;
> +        }
> +    }
> +
> +    QLIST_FOREACH_SAFE(state, &spapr->pending_flush_states, node, next) {

Sane comments here.

> +        if (flush_token < state->continue_token) {
> +            flush_token =3D state->continue_token;
> +        }
> +
> +        drc =3D spapr_drc_by_index(state->drcidx);
> +        dimm =3D PC_DIMM(drc->dev);
> +        backend =3D MEMORY_BACKEND(dimm->hostmem);
> +        state->backend_fd =3D memory_region_get_fd(&backend->mr);
> +
> +        thread_pool_submit_aio(pool, flush_worker_cb, state,
> +                               spapr_nvdimm_flush_completion_cb, state);
> +    }
> +
> +    return 0;
> +}
> +
> +const VMStateDescription vmstate_spapr_nvdimm_states =3D {
> +    .name =3D "spapr_nvdimm_states",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D spapr_nvdimm_states_needed,
> +    .post_load =3D spapr_nvdimm_post_load,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_QLIST_V(completed_flush_states, SpaprMachineState, 1,
> +                        vmstate_spapr_nvdimm_flush_state,
> +                        SpaprNVDIMMDeviceFlushState, node),
> +        VMSTATE_QLIST_V(pending_flush_states, SpaprMachineState, 1,
> +                        vmstate_spapr_nvdimm_flush_state,
> +                        SpaprNVDIMMDeviceFlushState, node),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +/*
> + * Assign a token and reserve it for the new flush state.
> + */
> +static SpaprNVDIMMDeviceFlushState *spapr_nvdimm_init_new_flush_state(
> +                                                      SpaprMachineState =
*spapr)
> +{
> +    SpaprNVDIMMDeviceFlushState *state;
> +
> +    state =3D g_malloc0(sizeof(*state));
> +
> +    flush_token++;
> +    /* Token zero is presumed as no job pending. Handle the overflow to =
zero */
> +    if (flush_token =3D=3D 0) {
> +        flush_token++;

Hmm... strictly speaking, this isn't safe.  It's basically never going
to happen in practice, but in theory there's nothing preventing
continue_token 1 still being outstanding when the flush_token counter
overflows.

Come to think of it, since it's a uint64_t, I think an actual overflow
is also never going to happen in practice.  Maybe we should just
assert() on overflow, and fix it in the unlikely event that we ever
discover a case where it could happen.

> +    }
> +    state->continue_token =3D flush_token;
> +
> +    QLIST_INSERT_HEAD(&spapr->pending_flush_states, state, node);
> +
> +    return state;
> +}
> +
> +/*
> + * spapr_nvdimm_finish_flushes
> + *      Waits for all pending flush requests to complete
> + *      their execution and free the states
> + */
> +void spapr_nvdimm_finish_flushes(SpaprMachineState *spapr)
> +{
> +    SpaprNVDIMMDeviceFlushState *state, *next;
> +
> +    /*
> +     * Called on reset path, the main loop thread which calls
> +     * the pending BHs has gotten out running in the reset path,
> +     * finally reaching here. Other code path being guest
> +     * h_client_architecture_support, thats early boot up.
> +     */
> +    while (!QLIST_EMPTY(&spapr->pending_flush_states)) {
> +        aio_poll(qemu_get_aio_context(), true);
> +    }
> +
> +    QLIST_FOREACH_SAFE(state, &spapr->completed_flush_states, node, next=
) {
> +        QLIST_REMOVE(state, node);
> +        g_free(state);
> +    }
> +}
> +
> +/*
> + * spapr_nvdimm_get_flush_status
> + *      Fetches the status of the hcall worker and returns
> + *      H_LONG_BUSY_XYZ if the worker is still running.
> + */
> +static int spapr_nvdimm_get_flush_status(SpaprMachineState *spapr,
> +                                         uint64_t token)
> +{
> +    int ret =3D H_LONG_BUSY_ORDER_10_MSEC;
> +    SpaprNVDIMMDeviceFlushState *state, *node;
> +
> +    QLIST_FOREACH_SAFE(state, &spapr->pending_flush_states, node, node) {
> +        if (state->continue_token =3D=3D token) {
> +            goto exit;
> +        }
> +    }
> +    ret =3D H_P2; /* If not found in complete list too, invalid token */
> +    QLIST_FOREACH_SAFE(state, &spapr->completed_flush_states, node, node=
) {
> +        if (state->continue_token =3D=3D token) {
> +            ret =3D state->hcall_ret;
> +            QLIST_REMOVE(state, node);
> +            g_free(state);
> +            break;
> +        }
> +    }
> +exit:
> +    return ret;
> +}
> +
> +/*
> + * H_SCM_FLUSH
> + * Input: drc_index, continue-token
> + * Out: continue-token
> + * Return Value: H_SUCCESS, H_Parameter, H_P2, H_LONG_BUSY
> + *
> + * Given a DRC Index Flush the data to backend NVDIMM device.
> + * The hcall returns H_LONG_BUSY_XX when the flush takes longer time and
> + * the hcall needs to be issued multiple times in order to be completely
> + * serviced. The continue-token from the output to be passed in the
> + * argument list of subsequent hcalls until the hcall is completely serv=
iced
> + * at which point H_SUCCESS or other error is returned.
> + */
> +static target_ulong h_scm_flush(PowerPCCPU *cpu, SpaprMachineState *spap=
r,
> +                                target_ulong opcode, target_ulong *args)
> +{
> +    int ret;
> +    uint32_t drc_index =3D args[0];
> +    uint64_t continue_token =3D args[1];
> +    SpaprDrc *drc =3D spapr_drc_by_index(drc_index);
> +    PCDIMMDevice *dimm;
> +    HostMemoryBackend *backend =3D NULL;
> +    SpaprNVDIMMDeviceFlushState *state;
> +    ThreadPool *pool =3D aio_get_thread_pool(qemu_get_aio_context());
> +    int fd;
> +
> +    if (!drc || !drc->dev ||
> +        spapr_drc_type(drc) !=3D SPAPR_DR_CONNECTOR_TYPE_PMEM) {
> +        return H_PARAMETER;
> +    }
> +
> +    if (continue_token !=3D 0) {
> +        goto get_status;

Ugly goto, just reverse the sense and put the next chunk in the if body.

> +    }
> +
> +    dimm =3D PC_DIMM(drc->dev);
> +    backend =3D MEMORY_BACKEND(dimm->hostmem);
> +    fd =3D memory_region_get_fd(&backend->mr);
> +
> +    if (fd < 0) {
> +        return H_UNSUPPORTED;
> +    }
> +
> +    state =3D spapr_nvdimm_init_new_flush_state(spapr);
> +    if (!state) {
> +        return H_HARDWARE;
> +    }
> +
> +    state->drcidx =3D drc_index;
> +    state->backend_fd =3D fd;
> +
> +    thread_pool_submit_aio(pool, flush_worker_cb, state,
> +                           spapr_nvdimm_flush_completion_cb, state);
> +
> +    continue_token =3D state->continue_token;
> +
> +get_status:
> +    ret =3D spapr_nvdimm_get_flush_status(spapr, continue_token);
> +    if (H_IS_LONG_BUSY(ret)) {
> +        args[0] =3D continue_token;
> +    }
> +
> +    return ret;
> +}
> +
>  static target_ulong h_scm_unbind_mem(PowerPCCPU *cpu, SpaprMachineState =
*spapr,
>                                       target_ulong opcode, target_ulong *=
args)
>  {
> @@ -523,6 +762,7 @@ static void spapr_scm_register_types(void)
>      spapr_register_hypercall(H_SCM_UNBIND_MEM, h_scm_unbind_mem);
>      spapr_register_hypercall(H_SCM_UNBIND_ALL, h_scm_unbind_all);
>      spapr_register_hypercall(H_SCM_HEALTH, h_scm_health);
> +    spapr_register_hypercall(H_SCM_FLUSH, h_scm_flush);
>  }
> =20
>  type_init(spapr_scm_register_types)
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index f05219f75e..1684d72546 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -12,10 +12,12 @@
>  #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
>  #include "hw/ppc/xics.h"        /* For ICSState */
>  #include "hw/ppc/spapr_tpm_proxy.h"
> +#include "hw/ppc/spapr_nvdimm.h"
> =20
>  struct SpaprVioBus;
>  struct SpaprPhbState;
>  struct SpaprNvram;
> +struct SpaprNVDIMMDeviceFlushState;
> =20
>  typedef struct SpaprEventLogEntry SpaprEventLogEntry;
>  typedef struct SpaprEventSource SpaprEventSource;
> @@ -248,6 +250,11 @@ struct SpaprMachineState {
>      uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE=
];
> =20
>      Error *fwnmi_migration_blocker;
> +
> +    /* nvdimm flush states */
> +    QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) pending_flush_states;
> +    QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) completed_flush_states;
> +
>  };
> =20
>  #define H_SUCCESS         0
> @@ -328,6 +335,7 @@ struct SpaprMachineState {
>  #define H_P7              -60
>  #define H_P8              -61
>  #define H_P9              -62
> +#define H_UNSUPPORTED     -67
>  #define H_OVERLAP         -68
>  #define H_UNSUPPORTED_FLAG -256
>  #define H_MULTI_THREADS_ACTIVE -9005
> @@ -542,8 +550,9 @@ struct SpaprMachineState {
>  #define H_SCM_UNBIND_MEM        0x3F0
>  #define H_SCM_UNBIND_ALL        0x3FC
>  #define H_SCM_HEALTH            0x400
> +#define H_SCM_FLUSH             0x44C
> =20
> -#define MAX_HCALL_OPCODE        H_SCM_HEALTH
> +#define MAX_HCALL_OPCODE        H_SCM_FLUSH
> =20
>  /* The hcalls above are standardized in PAPR and implemented by pHyp
>   * as well.
> diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.h
> index 764f999f54..24d8e37b33 100644
> --- a/include/hw/ppc/spapr_nvdimm.h
> +++ b/include/hw/ppc/spapr_nvdimm.h
> @@ -11,6 +11,7 @@
>  #define HW_SPAPR_NVDIMM_H
> =20
>  #include "hw/mem/nvdimm.h"
> +#include "migration/vmstate.h"
> =20
>  typedef struct SpaprDrc SpaprDrc;
>  typedef struct SpaprMachineState SpaprMachineState;
> @@ -21,5 +22,17 @@ void spapr_dt_persistent_memory(SpaprMachineState *spa=
pr, void *fdt);
>  bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nv=
dimm,
>                             uint64_t size, Error **errp);
>  void spapr_add_nvdimm(DeviceState *dev, uint64_t slot);
> +void spapr_nvdimm_finish_flushes(SpaprMachineState *spapr);
> +
> +typedef struct SpaprNVDIMMDeviceFlushState {
> +    uint64_t continue_token;
> +    int64_t hcall_ret;
> +    int backend_fd;
> +    uint32_t drcidx;
> +
> +    QLIST_ENTRY(SpaprNVDIMMDeviceFlushState) node;
> +} SpaprNVDIMMDeviceFlushState;
> +
> +extern const VMStateDescription vmstate_spapr_nvdimm_states;
> =20
>  #endif
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sEy+QjDdyRzU+2cX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFJemwACgkQbDjKyiDZ
s5Knxw//WE6jBIE93x+IhNaRvLzHF6loWZhwmNb/MV0BISFdfxk1yqO7Kc6PylTL
QcxLNm1wsvDqSuAMl5tfFfHd2FO9iPQYOl+8Z4apwPH3Wq0/4SO90owCHUWWK4TM
rZVK5MaBuldWkGcVYQ43Al05HmKZptmyxOzkz1Q9PTvtNFmnKOEXoeYNG3QpBpfZ
NnRrtCNIyRiaBpW38cdDJigyRaHMuDuiz1d3abpeuukvtN0yvricMybtYz3RorZ3
Hh//0PTvZdRD3/GwZ7MZYVBZnvUNGXxZ7MEXiTdDlad/42nOgtgzryVFDHVUKrcM
zzcypZG8kiNh+X/whKDXRMepUmT4CgkN8nXouC9q344YWLW6r8iIIDkAd/AFENy7
PUwJ8PEMs7ew0+bydl6CrhKjNB26JGpnlYplp6OV21Jy9AsOYv4xFcsoAbU6FdO8
DWTALzc+TQPBnNZuFT6Z9bjv+E0R2jVPD6pFUn04iSEK8rWHuYxLeAKiQqPF96LC
38yZD3mTSAG1nSKEvMFhtmloo5FfFSjlZaCDFiC7Buc1oxSuEJlqtew0rTQi1wTl
BnXWgBuG+ZSn5S4H6wtPcStTnPzoWk2BWwt6/gJ7/Fj7541Ksp7rgjNM/4X88cuF
+bfbH7ezwi3rnQ6vtUNvMunB4ZZR9IwNVudF2dZP35WfuLpSf9A=
=aMjk
-----END PGP SIGNATURE-----

--sEy+QjDdyRzU+2cX--

