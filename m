Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238ED53760A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 09:53:46 +0200 (CEST)
Received: from localhost ([::1]:43080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvaDg-0003mx-W8
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 03:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nvaA1-0001bv-N2
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nva9z-0002Cd-1n
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653896994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IjE+4OyPR50YkcNltrvDbHHxmJMQcqCZk9WFZCehurw=;
 b=dMnGior4h7t9vkChlVNTeFh4M52unk67PAeeWYhPYVzZpQ1FV/SbM4lbWMCBWJL8E/Mp8Q
 GnK0nuCN9xSq8cLYTYYirl+NWl5gVRSr8hJXZWurJ0wxQxirtwd3QxXbY0vMP/BLmN9CeP
 ksoKfSknCCOAp/OGgvmxvU5xyJuRvmE=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-TLUVsDIeNLKRozOh5cTynA-1; Mon, 30 May 2022 03:49:52 -0400
X-MC-Unique: TLUVsDIeNLKRozOh5cTynA-1
Received: by mail-yb1-f200.google.com with SMTP id
 y139-20020a253291000000b0065cff9ce37aso822708yby.23
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 00:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IjE+4OyPR50YkcNltrvDbHHxmJMQcqCZk9WFZCehurw=;
 b=fQ0uH25hne+7tjSQXGvDBLp+mQKuCEPZDSxLRkIlmalHWp7Z6htRvQ6Znp7lphH+e1
 +LfFna9NqrQ2hx8ma3JXUD4mPXmswss/vOzoOnH55kzo1TcGCwkHpQ7ezIsqmK+zqmzg
 iDNAFRzxTvmSEzQBfubenkasCAPUkKP6it+osUN2VJfLm2Pr2zbbu3kIcvmY6PzQRpmR
 rqociWZER8fSod18M13ciY4s+MQNrAXTBlIpG+pQ/dx9GnU0WI3p6FUQ5a4q65ulh6Gc
 LPi5K/Vpr0zVjeO6NGIBi76E5nGsTD28tzaDTfDzkp22h+4UEsd5uu2cTO//IDh+qhHk
 TU3g==
X-Gm-Message-State: AOAM532xvQ1HZHVLo6BRSdHx8twOh3NPH+wlbSaAIy/5U9AwrwRtunTV
 C8QpA1lAY95k1vpAjbDj8SJySwZYz2WLnsfPGVQl3H66bGuMfB5YWLNdY3kfc7t6KvfTfehletN
 cQm633fsxZhQBiatUkJy3HnNpFVSlQUU=
X-Received: by 2002:a81:e8b:0:b0:30c:32af:74f with SMTP id
 133-20020a810e8b000000b0030c32af074fmr6561391ywo.33.1653896992125; 
 Mon, 30 May 2022 00:49:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6SGAVyjKui/fTPHegXzCs0mK2r3TUCrwn21s80jEhapaSY1b5rQK5g9elKFbSsAuNv9SGImZSVSUNGSTFKZk=
X-Received: by 2002:a81:e8b:0:b0:30c:32af:74f with SMTP id
 133-20020a810e8b000000b0030c32af074fmr6561380ywo.33.1653896991908; 
 Mon, 30 May 2022 00:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220527173058.226210-1-stefanb@linux.ibm.com>
 <CAMxuvax1PkLZb+Ms6n1wCyd8hHFsPQwi3xaM+RM0c1x7imQAzA@mail.gmail.com>
 <7b6d1edf-882f-a369-67c9-5ed5f1d7ce51@linux.ibm.com>
 <1eef83c7-9fb9-1060-a993-5b7d3ac47ffe@linux.ibm.com>
In-Reply-To: <1eef83c7-9fb9-1060-a993-5b7d3ac47ffe@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 30 May 2022 09:49:41 +0200
Message-ID: <CAMxuvazTLvO2evMmxGP+S+RN7VinM97mo81U8MVF0mSmYqLHSQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] backend/tpm: Resolve issue with TPM 2 DA lockout
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sat, May 28, 2022 at 7:23 PM Stefan Berger <stefanb@linux.ibm.com> wrote=
:
>
>
>
> On 5/27/22 15:31, Stefan Berger wrote:
> >
> >
> > On 5/27/22 15:24, Marc-Andr=C3=A9 Lureau wrote:
> >> Hi
> >>
> >> On Fri, May 27, 2022 at 7:36 PM Stefan Berger <stefanb@linux.ibm.com>
> >> wrote:
> >>>
> >>> This series of patches resolves an issue with a TPM 2's dictionary
> >>> attack
> >>> lockout logic being triggered upon well-timed VM resets. Normally,
> >>> the OS
> >>> TPM driver sends a TPM2_Shutdown to the TPM 2 upon reboot and before
> >>> a VM
> >>> is reset. However, the OS driver cannot do this when the user resets
> >>> a VM.
> >>> In this case QEMU must send the command because otherwise several wel=
l-
> >>> timed VM resets will trigger the TPM 2's dictionary attack (DA) logic
> >>> and
> >>> it will then refuse to do certain key-related operations until the DA
> >>> logic has timed out.
> >>
> >> How does real hardware deal with that situation? Shouldn't this
> >> "shutdown"/reset logic be implemented on swtpm side instead, when
> >> CMD_INIT is received? (when the VM is restarted)
> > I don't know what real hardware can actually do when the machine is
> > reset, presumably via some reset line, or the power is removed. Probabl=
y
> > it has no way to react to this.
> >
> > Typically the OS driver has to send the command and since it cannot do
> > this I would defer it to the TPM emulator reset handler code, so the
> > next layer down.
>
> Also, when this is done in QEMU we don't need to do a data channel
> operation (run TPM2_Shutdown) from within the control channel (upon
> CMD_INIT) inside of swtpm. This way we can deal with it properly. The
> usage model for the TPM 2 prescribes that a TPM2_Shutdown must be sent
> before a shutdown or reset of the system, so let's let QEMU do it if the
> OS cannot do it.

What if qemu is killed or crashed, and a new instance is connected to
swtpm? Or more subtle, the VM reboots without qemu help (no reset
handler). It feels like it would be more robust to handle the
situation in swtpm. Why not have the same last operation tracking and
shutdown logic there? If CMD_INIT is received and the last operation
is not shutdown, I'd have a warning and do it (if this is compliant
with the spec, I am trying to find relevant text).


>
> >
> >
> >
> >>
> >>>
> >>> Regards,
> >>>    Stefan
> >>>
> >>> Stefan Berger (2):
> >>>    backends/tpm: Record the last command sent to the TPM
> >>>    backends/tpm: Send TPM2_Shutdown upon VM reset
> >>>
> >>>   backends/tpm/tpm_emulator.c | 44 ++++++++++++++++++++++++++++++++++=
+++
> >>>   backends/tpm/tpm_int.h      |  3 +++
> >>>   backends/tpm/tpm_util.c     |  9 ++++++++
> >>>   backends/tpm/trace-events   |  1 +
> >>>   include/sysemu/tpm_util.h   |  3 +++
> >>>   5 files changed, 60 insertions(+)
> >>>
> >>> --
> >>> 2.35.3
> >>>
> >>
>


