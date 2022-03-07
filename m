Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2F4CFF70
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:03:00 +0100 (CET)
Received: from localhost ([::1]:47192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRD0t-0000yR-5I
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:02:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRCEQ-000683-1T
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:12:54 -0500
Received: from [2a00:1450:4864:20::42a] (port=44690
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRCEO-0007iu-4Z
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:12:53 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u1so22892780wrg.11
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 04:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XVZfkw1XuCG8Aw8p1G3mgww2P8jHr30ZypFWDOnyCFU=;
 b=CGerqLVF1AjJc2v5mXaAgXVjzPU+enEtyL/vJkzxhuT2AGI39mzK1y0KK3hEGuzD3a
 LUovWK7SM2FLqLS2J6OhuR89boIje5Ng2j0FVT8NR1PlCKTNEc0RlorTJn8uMvYmAyyt
 SFxT91FHCpvOPWcEDKIjWLun3fYqFtSpDTEZttRqo2uF19UcnukMrzMjepl2wYmFFiiW
 l5gb4P8IcuLu/OD6wq6dwepCVdrQ8n4kr0Kt2i+qqRNNHZjJSmXzOClD33YcnZStW5pD
 sezGgE5Uk63Vd1zYI+mrX6sGGXWuJROHX/EO+YaUrbADl1RoB6PTmZXTuDHGRd8nxThj
 gQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XVZfkw1XuCG8Aw8p1G3mgww2P8jHr30ZypFWDOnyCFU=;
 b=iTFRgWbj3azXlOKI4qwWBQPl3sKuXPi0Mb/qCNu+lry2BdXO7FfwdvWHEyLi+jRGgv
 r3i2oZjDAV+F8fS0ANoEcE0sCjG4P0juXLQG0FW/ifPMaU6lH+D/CLGX7N+ruFJw3DHC
 alDyqcW1TRVx8GdzrV7vhYyzucZXEblhdazfcZeu827QU3venrD/VUTCdpNLGAlRxfma
 5nNA6KqhziTR+VjL0zwZpXeg4vbLSbvHhr1ZiE/BYCAYJcJUf8XDhw/Uxk9DbIojveCP
 5equO9J8/d5MLSayFiKYmJscSRwGCz+jKG0trL4/wWTutbDPxFga/QnpP30gDGqS9+rJ
 fGIA==
X-Gm-Message-State: AOAM530H5axb9+gL97SlAgFYdRe4LEeCKRKxr4R9gp9HW6aSAvT8ECQr
 f2kt37kbKRNnDSIhUE7lLVpC9A==
X-Google-Smtp-Source: ABdhPJzARln+z91lzPcFpLkEust1OT13DhO4pHpq0ofrivhZy2/Duz/JzVMyWMP1tafULRdLxQITOQ==
X-Received: by 2002:a5d:64c5:0:b0:1f1:e6b8:bd3c with SMTP id
 f5-20020a5d64c5000000b001f1e6b8bd3cmr5398953wri.686.1646655168856; 
 Mon, 07 Mar 2022 04:12:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a5d4945000000b001f06372fa9fsm17060735wrs.54.2022.03.07.04.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 04:12:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE0DC1FFB7;
 Mon,  7 Mar 2022 12:12:46 +0000 (GMT)
References: <87ee3q3mos.fsf@linaro.org> <87a6ee3l5e.fsf@linaro.org>
 <YhzWMMLTZY1e24Uh@stefanha-x1.localdomain> <87mtiblzsc.fsf@linaro.org>
 <Yh0FV+0SfdPugRRX@stefanha-x1.localdomain> <87tucdhd5w.fsf@linaro.org>
 <YiXOkOvu7W18MHFZ@stefanha-x1.localdomain>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: What is the correct way to handle the VirtIO config space in
 vhost-user?
Date: Mon, 07 Mar 2022 12:09:59 +0000
In-reply-to: <YiXOkOvu7W18MHFZ@stefanha-x1.localdomain>
Message-ID: <871qzegdvl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> [[PGP Signed Part:Undecided]]
> On Fri, Mar 04, 2022 at 04:49:30PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Stefan Hajnoczi <stefanha@redhat.com> writes:
>>=20
>> > [[PGP Signed Part:Undecided]]
>> > On Mon, Feb 28, 2022 at 04:16:43PM +0000, Alex Benn=C3=A9e wrote:
>> >>=20
>> >> Stefan Hajnoczi <stefanha@redhat.com> writes:
>> >>=20
>> >> > [[PGP Signed Part:Undecided]]
>> >> > On Fri, Feb 25, 2022 at 05:32:43PM +0000, Alex Benn=C3=A9e wrote:
>> >> >>=20
>> >> >> [Apologies to CC list for repost due to fat fingering the mailing =
list address]
>> >> >>=20
>> >> <snip>
>> >> >>=20
>> >> >> (aside: this continues my QOM confusion about when things should b=
e in a
>> >> >> class or instance init, up until this point I hadn't needed it in =
my
>> >> >> stub).
>> >> >
>> >> > Class init is a one-time per-class initializer function. It is most=
ly
>> >> > used for setting up callbacks/overridden methods from the base clas=
s.
>> >> >
>> >> > Instance init is like an object constructor in object-oriented
>> >> > programming.
>> >>=20
>> >> I phrased my statement poorly. What I meant to say is I sometimes find
>> >> QEMUs approach to using class over instance initialisation inconsiste=
nt.
>> >> I think I understand the "policy" as use class init until there is a
>> >> case where you can't (e.g. having individual control of each instance=
 of
>> >> a device).
>> >>=20
>> >> > This is not a .get_config() method, it's a VIRTIO configuration cha=
nge
>> >> > notification handler. The vhost-user-blk device server ("slave") se=
nds
>> >> > this notification to notify the driver that configuration space con=
tents
>> >> > have been updated (e.g. the disk was resized).
>> >>=20
>> >> So this should come in the initial vhost-user set of handshake messag=
es
>> >> if the VHOST_USER_PROTOCOL_F_CONFIG is negotiated between the master =
and
>> >> slave? I guess without this protocol feature vhost-user can't support
>> >> writeable config spaces?
>> >
>> > The VHOST_USER_PROTOCOL_F_CONFIG vhost-user protocol feature bit
>> > enables:
>> > 1. VHOST_USER_GET_CONFIG - reading configuration space
>> > 2. VHOST_USER_SET_CONFIG - writing configuration space
>> > 3. VHOST_USER_SLAVE_CONFIG_CHANGE_MSG - change notifications
>> >
>> > If the vhost-user server is supposed to participate in configuration
>> > space accesses/notifications, then it needs to implement
>> > VHOST_USER_PROTOCOL_F_CONFIG.
>> >
>> > QEMU's vhost-user-blk assumes the vhost-user server supports
>> > VHOST_USER_PROTOCOL_F_CONFIG. It's an optional vhost-user protocol
>> > feature but the virtio-blk device relies on configuration space
>> > (otherwise QEMU's --device vhost-user-blk wouldn't know the capacity of
>> > the disk). vhost_user_blk_realize_connect() sends VHOST_USER_GET_CONFIG
>> > to fetch the configuration space contents when the device is
>> > instantiated.
>> >
>> > Some vhost-user device types don't need VHOST_USER_PROTOCOL_F_CONFIG. =
In
>> > that case QEMU's --device vhost-user-FOO implements .get/set_config()
>> > itself. virtio-net is an example where this is the case.
>>=20
>> I wonder when the last time this was tested was because since 1c3e5a2617
>> (vhost-user: back SET/GET_CONFIG requests with a protocol feature) the
>> check in vhost_user_backend_init is:
>>=20
>>    if (!dev->config_ops || !dev->config_ops->vhost_dev_config_notifier) {
>>        /* Don't acknowledge CONFIG feature if device doesn't support it =
*/
>>        dev->protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F_CONFI=
G);
>>    } else if (!(protocol_features &
>>                (1ULL << VHOST_USER_PROTOCOL_F_CONFIG))) {
>>        error_setg(errp, "Device expects VHOST_USER_PROTOCOL_F_CONFIG "
>>                   "but backend does not support it.");
>>        return -EINVAL;
>>    }
>>=20
>> which means I don't think it ever asks the vhost-user backend.
>
> Can you describe what you have in mind? The issue isn't clear to me.

I had to patch out that config_ops check to get the get_config over
vhost to work. Otherwise QEMU keeps complaining:

  qemu-system-aarch64: VHOST_USER_PROTOCOL_F_CONFIG not supported

because it itself has squashed the feature in the vhost protocol
negotiation.


>
> Stefan
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

