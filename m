Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2542759FAD3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 15:04:18 +0200 (CEST)
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQq3L-0001lm-Vh
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 09:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oQpjt-0007bu-Pk
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 08:44:09 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:41712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oQpjq-0001Lh-V3
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 08:44:09 -0400
Received: by mail-lf1-x12e.google.com with SMTP id l1so23294670lfk.8
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 05:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=1RnP3lM+YurP05rVrhhTvzbnTQaXJt1BEmlrRt1AEA4=;
 b=NvBk1E26+t1apSRU3AmG/cqWksAGhIVB5PLzLtt3uHwuIxk74o0m4qjW6/vhFS/o0V
 W2P1dTDkzpgXqkE0jTasoF7zkBanXwvQaOqaxQAKG4IDOhvlNipyVI/jwtBaOw3q0YIb
 75wRs6hvkHbS76Svu6Q2eoleXdatcmTagCicQfQmeF7h9IecnngaEwowl9rM920K9lm9
 xmwvDV+iFgt6363jm0H4/Kx0n/jHVAZjD+GaifPyNcjqkZjF5860F8yYaSsgI4q8Tilm
 p//ueWr2oK6MacQcZnrVUgyb/i/yKL8i2lwLzGNipniTZ8QmA/Xaby6heq+R50U3izf0
 hmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=1RnP3lM+YurP05rVrhhTvzbnTQaXJt1BEmlrRt1AEA4=;
 b=wRj9KTiJfLeiE0D6z7HNiW4nC8nnD+GcCca0dDU9BmI395fcj5gelag/8QllFzPrqz
 i0I+Fyk0D3/13ZIImwMelaUCp00tHDwGrbRPrOzKTI+V90ptk0EG86ZD7F2iY+A7q9ot
 JPpGZlv0g23bqOuEFrga5Q7zfFkUl7OjiFJU65k/ufg6ybaFI40ZS9iIWNhGGpEGMRNz
 rTPJsWJOQ4OQ//el3eia4I7yZwhX0j/V7b9NTwXsEHj/F9MpCPPrVcan2OvZAVUrd+D8
 k4mNWvP/tG8jq8184sw3cw+4qYRtA79K5cfTDspkAd+0fKLfH5Jv3i7U4xat6jHRnsaZ
 ZMjA==
X-Gm-Message-State: ACgBeo0LuOCy8DBOPMbMlXQwhZJETR7pe8Cb0iniqm3qri/Bd2Ry3Jb+
 wtI6ingbL7SvfASo6JW2775+mk5rJglRailkTKnnmTXgpQWpaA==
X-Google-Smtp-Source: AA6agR6ER2UOz+WMsbmlZVevwiAs377bUxfOmMF9MNstZQ28tCN0DaZ39CLSDrsFhY95Rwjt/eAbKV1gyRNjILrxvgg=
X-Received: by 2002:a05:6512:2394:b0:492:df50:28ce with SMTP id
 c20-20020a056512239400b00492df5028cemr6069759lfv.328.1661345044303; Wed, 24
 Aug 2022 05:44:04 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 24 Aug 2022 16:43:53 +0400
Message-ID: <CAJ+F1CL27O8dmGSws=-QgutRRpM2NHcued28gnvt5jWo2WeUvw@mail.gmail.com>
Subject: Page alignment & memory regions expectations
To: QEMU <qemu-devel@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 David Hildenbrand <david@redhat.com>, qiaonuohan@cn.fujitsu.com
Content-Type: multipart/alternative; boundary="00000000000037165d05e6fc093d"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000037165d05e6fc093d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

tpm-crb creates a "tpm-crb-cmd" RAM memory region that is not page aligned.
Apparently, this is not a problem for QEMU in general. However, it crashes
kdump'ing in dump.c:get_next_page, as it expects GuestPhysBlock to be
page-aligned. (see also bug
https://bugzilla.redhat.com/show_bug.cgi?id=3D2120480)

Here is some relevant DEBUG_GUEST_PHYS_REGION_ADD log:
guest_phys_block_add_section: target_start=3D00000000fd000000
target_end=3D00000000fe000000: added (count: 3)
guest_phys_block_add_section: target_start=3D00000000fed40080
target_end=3D00000000fed41000: added (count: 4)
guest_phys_block_add_section: target_start=3D00000000fffc0000
target_end=3D0000000100000000: added (count: 5)

I am looking for ideas on how to solve this crash.

Should qemu enforce that memory regions are target page-aligned? In which
case, TPM CRB MMIO region would overlap with the RAM region, and I wonder
how that turns out to be, and if other devices would be impacted etc

Or should kdump learn to handle non-aligned blocks somehow? I think that
option should make a reasonable solution, as long as we only have
empty/zero-memory "gaps". Handling other cases of joint or overlapping
regions seems more difficult.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--00000000000037165d05e6fc093d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>tpm-crb creates a &quot;=
tpm-crb-cmd&quot; RAM memory region that is not page aligned. Apparently, t=
his is not a problem for QEMU in general. However, it crashes kdump&#39;ing=
 in dump.c:get_next_page, as it expects GuestPhysBlock to be page-aligned. =
(see also bug <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2120=
480">https://bugzilla.redhat.com/show_bug.cgi?id=3D2120480</a>)</div><div><=
br></div><div>Here is some relevant DEBUG_GUEST_PHYS_REGION_ADD log:<br></d=
iv><div>guest_phys_block_add_section: target_start=3D00000000fd000000 targe=
t_end=3D00000000fe000000: added (count: 3)<br>guest_phys_block_add_section:=
 target_start=3D00000000fed40080 target_end=3D00000000fed41000: added (coun=
t: 4)<br>guest_phys_block_add_section: target_start=3D00000000fffc0000 targ=
et_end=3D0000000100000000: added (count: 5)<br></div><div><br></div><div>I =
am looking for ideas on how to solve this crash.</div><div><br></div><div>S=
hould qemu enforce that memory regions are target page-aligned? In which ca=
se, TPM CRB MMIO region would overlap with the RAM region, and I wonder how=
 that turns out to be, and if other devices would be impacted etc<br></div>=
<div><br></div><div>Or should kdump learn to handle non-aligned blocks some=
how? I think that option should make a reasonable solution, as long as we o=
nly have empty/zero-memory &quot;gaps&quot;. Handling other cases of joint =
or overlapping regions seems more difficult.<br></div><div><br></div><div>t=
hanks<br></div><div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></d=
iv>

--00000000000037165d05e6fc093d--

