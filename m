Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76275B1472
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 08:12:09 +0200 (CEST)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWAlk-00036E-9q
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 02:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oWAeh-0007Po-Hs
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 02:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oWAee-000589-Dw
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 02:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662617086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+cPgBHYa98JxUmfAFzZZFdu/2y8WroLPb5EDSPdgvKY=;
 b=RO1p4KbhpAz3XLPu3B5By/YBd8y7IQ9IFdKZaYvURie1ZzNXoSD8ywrbBkkgJk9stVLbYU
 dbUcaBJAQO4Kyhs68jyXApxtKowqs+E6518zWxi6NkgBocOUtqOvSbLRM31R3UkdfwyT8h
 VvaOmDDs/Aa3VGJQb0wFPUL3+ZjD84k=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-zacUaC3FOhKLjSKvonxsDQ-1; Thu, 08 Sep 2022 02:04:45 -0400
X-MC-Unique: zacUaC3FOhKLjSKvonxsDQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 x64-20020a9d20c6000000b006372db8b20bso9040716ota.8
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 23:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+cPgBHYa98JxUmfAFzZZFdu/2y8WroLPb5EDSPdgvKY=;
 b=uYQECxQmxx36QHL9Lb0JaC2zWDlwGkUoiPRLo0jn1RjoD9hEbAvWUpU6gJ3PqTQUw9
 8iCxjMcsyMObwAPcD6nJek8u1vhjkX0o0hNQOHb6dRIYC5nUkp40fP8PErM2QwzZ1Ucf
 qoCl5hOyWBLGI61H4mItKNqVbi6xPdcI38hY0GYA9IlNCJ8pr4AoOIDBMrmeY24n5wYT
 d8cZ1xUCNi6JX1EjZaygX3QnTrFNYVsUbaadaG4baBUzYGizQ599nU1GrmTBvgav72ct
 g3n+qB23pYkCbc4iJOAUBAyxL1GNwgWJFpItqxaeg19g2A78BFbzfIEwPPY/iF0QFw5L
 EEnA==
X-Gm-Message-State: ACgBeo3Fsn4xk8N9D65Ovy+A9dIhILgIiJZkNQ9ufz0XLggEDt5JXVgY
 KsM620b9nzaCUnegnoGbDwO5MecVito4MymRoxIuY3UqSSB9RciVQPVObUJf2ZncZz4n0Z+imOG
 Pq//+H2/Y26tYOB0SaZJuEYg54LeGgl0=
X-Received: by 2002:a05:6808:1687:b0:347:cbd3:3dcf with SMTP id
 bb7-20020a056808168700b00347cbd33dcfmr794995oib.53.1662617084219; 
 Wed, 07 Sep 2022 23:04:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4W0mimFq/UQ3rOuSMxk2XdkSLmdMHSPzEDSxqO6X1HSdbQfUUHzaN2gswAJr1u8p5QrIzp3blAml+qKbZMr34=
X-Received: by 2002:a05:6808:1687:b0:347:cbd3:3dcf with SMTP id
 bb7-20020a056808168700b00347cbd33dcfmr794989oib.53.1662617083944; Wed, 07 Sep
 2022 23:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220907222821.1285082-1-stefanb@linux.ibm.com>
 <20220907222821.1285082-3-stefanb@linux.ibm.com>
In-Reply-To: <20220907222821.1285082-3-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 8 Sep 2022 10:04:32 +0400
Message-ID: <CAMxuvawHTT-r9Qz_PFgSEo+3yTFkgKBn7_PdqmBNv+W_DsT-hQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] tpm_emulator: Have swtpm relock storage upon
 migration fall-back
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Sep 8, 2022 at 2:28 AM Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> Swtpm may release the lock once the last one of its state blobs has been
> migrated out. In case of VM migration failure QEMU now needs to notify
> swtpm that it should again take the lock, which it can otherwise only do
> once it has received the first TPM command from the VM.
>
> Only try to send the lock command if swtpm supports it. It will not have
> released the lock (and support shared storage setups) if it doesn't
> support the locking command since the functionality of releasing the lock
> upon state blob reception and the lock command were added to swtpm
> 'together'.
>
> If QEMU sends the lock command and the storage has already been locked
> no error is reported.
>
> If swtpm does not receive the lock command (from older version of QEMU),
> it will lock the storage once the first TPM command has been received. So
> sending the lock command is an optimization.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  backends/tpm/tpm_emulator.c | 60 ++++++++++++++++++++++++++++++++++++-
>  backends/tpm/trace-events   |  2 ++
>  2 files changed, 61 insertions(+), 1 deletion(-)
>
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index 87d061e9bb..905ebfc8a9 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -34,6 +34,7 @@
>  #include "io/channel-socket.h"
>  #include "sysemu/tpm_backend.h"
>  #include "sysemu/tpm_util.h"
> +#include "sysemu/runstate.h"
>  #include "tpm_int.h"
>  #include "tpm_ioctl.h"
>  #include "migration/blocker.h"
> @@ -81,6 +82,9 @@ struct TPMEmulator {
>      unsigned int established_flag_cached:1;
>
>      TPMBlobBuffers state_blobs;
> +
> +    bool relock_storage;
> +    VMChangeStateEntry *vmstate;
>  };
>
>  struct tpm_error {
> @@ -302,6 +306,35 @@ static int tpm_emulator_stop_tpm(TPMBackend *tb)
>      return 0;
>  }
>
> +static int tpm_emulator_lock_storage(TPMEmulator *tpm_emu)
> +{
> +    ptm_lockstorage pls;
> +
> +    if (!TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(tpm_emu, PTM_CAP_LOCK_STORAGE)=
) {
> +        trace_tpm_emulator_lock_storage_cmd_not_supt();
> +        return 0;
> +    }
> +
> +    /* give failing side 100 * 10ms time to release lock */
> +    pls.u.req.retries =3D cpu_to_be32(100);

That's quite a short time imho. Is it going to try to lock it again
when the first command comes in? What's the timeout then? Is it
handled implicetly by the swtpm process?

> +    if (tpm_emulator_ctrlcmd(tpm_emu, CMD_LOCK_STORAGE, &pls,
> +                             sizeof(pls.u.req), sizeof(pls.u.resp)) < 0)=
 {
> +        error_report("tpm-emulator: Could not lock storage: %s",

add "after 1 second" ?

> +                     strerror(errno));
> +        return -1;
> +    }
> +
> +    pls.u.resp.tpm_result =3D be32_to_cpu(pls.u.resp.tpm_result);
> +    if (pls.u.resp.tpm_result !=3D 0) {
> +        error_report("tpm-emulator: TPM result for CMD_LOCK_STORAGE: 0x%=
x %s",
> +                     pls.u.resp.tpm_result,
> +                     tpm_emulator_strerror(pls.u.resp.tpm_result));
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
>  static int tpm_emulator_set_buffer_size(TPMBackend *tb,
>                                          size_t wanted_size,
>                                          size_t *actual_size)
> @@ -843,13 +876,34 @@ static int tpm_emulator_pre_save(void *opaque)
>  {
>      TPMBackend *tb =3D opaque;
>      TPMEmulator *tpm_emu =3D TPM_EMULATOR(tb);
> +    int ret;
>
>      trace_tpm_emulator_pre_save();
>
>      tpm_backend_finish_sync(tb);
>
>      /* get the state blobs from the TPM */
> -    return tpm_emulator_get_state_blobs(tpm_emu);
> +    ret =3D tpm_emulator_get_state_blobs(tpm_emu);
> +
> +    tpm_emu->relock_storage =3D ret =3D=3D 0;
> +
> +    return ret;
> +}
> +
> +static void tpm_emulator_vm_state_change(void *opaque, bool running,
> +                                         RunState state)
> +{
> +    TPMBackend *tb =3D opaque;
> +    TPMEmulator *tpm_emu =3D TPM_EMULATOR(tb);
> +
> +    trace_tpm_emulator_vm_state_change(running, state);
> +
> +    if (!running || state !=3D RUN_STATE_RUNNING || !tpm_emu->relock_sto=
rage) {
> +        return;
> +    }
> +
> +    /* lock storage after migration fall-back */
> +    tpm_emulator_lock_storage(tpm_emu);
>  }
>
>  /*
> @@ -911,6 +965,9 @@ static void tpm_emulator_inst_init(Object *obj)
>      tpm_emu->options =3D g_new0(TPMEmulatorOptions, 1);
>      tpm_emu->cur_locty_number =3D ~0;
>      qemu_mutex_init(&tpm_emu->mutex);
> +    tpm_emu->vmstate =3D
> +        qemu_add_vm_change_state_handler(tpm_emulator_vm_state_change,
> +                                         tpm_emu);
>
>      vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
>                       &vmstate_tpm_emulator, obj);
> @@ -960,6 +1017,7 @@ static void tpm_emulator_inst_finalize(Object *obj)
>      tpm_sized_buffer_reset(&state_blobs->savestate);
>
>      qemu_mutex_destroy(&tpm_emu->mutex);
> +    qemu_del_vm_change_state_handler(tpm_emu->vmstate);
>
>      vmstate_unregister(NULL, &vmstate_tpm_emulator, obj);
>  }
> diff --git a/backends/tpm/trace-events b/backends/tpm/trace-events
> index 3298766dd7..1ecef42a07 100644
> --- a/backends/tpm/trace-events
> +++ b/backends/tpm/trace-events
> @@ -20,6 +20,8 @@ tpm_emulator_set_buffer_size(uint32_t buffersize, uint3=
2_t minsize, uint32_t max
>  tpm_emulator_startup_tpm_resume(bool is_resume, size_t buffersize) "is_r=
esume: %d, buffer size: %zu"
>  tpm_emulator_get_tpm_established_flag(uint8_t flag) "got established fla=
g: %d"
>  tpm_emulator_cancel_cmd_not_supt(void) "Backend does not support CANCEL_=
TPM_CMD"
> +tpm_emulator_lock_storage_cmd_not_supt(void) "Backend does not support L=
OCK_STORAGE"
> +tpm_emulator_vm_state_change(int running, int state) "state change to ru=
nning %d state %d"
>  tpm_emulator_handle_device_opts_tpm12(void) "TPM Version 1.2"
>  tpm_emulator_handle_device_opts_tpm2(void) "TPM Version 2"
>  tpm_emulator_handle_device_opts_unspec(void) "TPM Version Unspecified"
> --
> 2.37.2
>

lgtm otherwise:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


