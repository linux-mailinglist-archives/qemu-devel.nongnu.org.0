Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE839F863
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:02:42 +0200 (CEST)
Received: from localhost ([::1]:48902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcJV-0005fS-7c
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqcHS-0004Ai-Th
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:00:35 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqcHQ-0004Wn-5G
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:00:34 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so1933822wmg.4
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 07:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=I7HDECExJ2qo/kep16Q+MMbJMVvmSHpwomS6CcyyitU=;
 b=qR+5/SFX7Rnrbpi5hK838IYKKgyZFrwAJhS/ELxs3AReYElt1MZ2oQl8f08c+an4qD
 wqVJKLr72141PXCX8myzV+kRhy6Aoa2uSU4Iws4Ld4ocpAL9dpt1UOlosHl67W49L2l2
 /M7OFdhc2L+05X233Bw/7hWiHn9+Jg5Jj0tC8eM3Hrk8i4g+1A2IGA3VxEAJBVF+AtLi
 R3hQkFnEHkZw2MSGNl7g11pRTjAS3223Jg1xgYXDVLK4vDrI3oa18qRV+GXqSW0s8X6D
 qhb+hRnJRvKu68BBzkN5xVftd1xmFDmv1Re3uT9qVAwNUcf0IABWBy1Zw79yeJdPprPx
 Ejfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=I7HDECExJ2qo/kep16Q+MMbJMVvmSHpwomS6CcyyitU=;
 b=uBvmq3aQbE9Et6G/2tB9rg5uIuXUF3ZwrJ9JbT/oZjN6aOIujgm3P4TiJdiZNvR+nr
 9JGhuqI8/jL9gTAEvygEhtFzwmSWpYRgmV2hRKIgtVKhGaJPzmxDkNHINvok4eFaeIil
 PV/tWFLzIIjBF2yRkQVLzkCKH7ddoNhCSRcAmPzggpeWygNTRVr5vHwd5iPH4RHJyovf
 wwp3Dui61fdv7ZAvzL5l8eCzs0eaOW9M4b9xq7Hg7kWzScOBFldLXsDKVqZAhr5Wp+DH
 /i8zJaRINLUAuaJIQtJYBf61cDM/tN9LsxKI0iZuSCpoUFASw3d2M8iF0wRelVhktiNt
 MP0g==
X-Gm-Message-State: AOAM530WDF4tzSpKjmXlZvl5gH2QkoEd9qhahuZxo7WYOeeLeC/pTOss
 xRQgFrjNcGVcidl6648Mo85diA==
X-Google-Smtp-Source: ABdhPJwxPFnNv80cCoaMhAnVuSVyggDoyfggnNK4jynAYpciE4dgppLjEcvvBkyIMGNRXvyid7Z9RA==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr22231210wmq.138.1623160830567; 
 Tue, 08 Jun 2021 07:00:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m23sm2725927wms.2.2021.06.08.07.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 07:00:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 462C61FF7E;
 Tue,  8 Jun 2021 15:00:29 +0100 (BST)
References: <20210607153155.1760158-1-jsnow@redhat.com>
 <20210607153155.1760158-3-jsnow@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 2/2] GitLab: Add "Feature Request" issue template.
Date: Tue, 08 Jun 2021 14:59:16 +0100
In-reply-to: <20210607153155.1760158-3-jsnow@redhat.com>
Message-ID: <87lf7klama.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> Based on Peter Krempa's libvirt template, feature.md.
>
> CC: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab/issue_templates/feature_request.md | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 .gitlab/issue_templates/feature_request.md
>
> diff --git a/.gitlab/issue_templates/feature_request.md b/.gitlab/issue_t=
emplates/feature_request.md
> new file mode 100644
> index 0000000000..fc58ca2763
> --- /dev/null
> +++ b/.gitlab/issue_templates/feature_request.md
> @@ -0,0 +1,32 @@
> +<!--
> +This is the upstream QEMU issue tracker.
> +
> +Please note that QEMU, like most open source projects, relies on
> +contributors who have motivation, skills and available time to work on
> +implementing particular features.
> +
> +Feature requests can be helpful for determining demand and interest, but
> +they are not a guarantee that a contributor will volunteer to implement
> +it. We welcome and encourage even draft patches to implement a feature
> +be sent to the mailing list where it can be discussed and developed
> +further by the community.
> +
> +Thank you for your interest in helping us to make QEMU better!
> +-->
> +
> +## Goal
> +<!-- Describe the final result you want to achieve. Avoid design specifi=
cs. -->
> +
> +
> +## Technical details
> +<!-- Describe technical details, design specifics, suggestions, versions=
, etc. -->
> +
> +
> +## Additional information

<!-- Patch or branch references, any other useful information -->?

Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> +
> +
> +<!--
> +The line below ensures that proper tags are added to the issue.
> +Please do not remove it.
> +-->
> +/label ~"kind::Feature Request"


--=20
Alex Benn=C3=A9e

