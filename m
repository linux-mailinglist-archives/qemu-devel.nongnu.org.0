Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E1A6E9D7E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 22:55:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbJI-00078Z-Oh; Thu, 20 Apr 2023 16:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbJD-00078I-14
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbJB-0005V9-Cm
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682024112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtP5OQ73KFQelsrdnOFD+HyKiuSQs/AtcLiIzo+PL/w=;
 b=UpxhULgSBVaocCTChFO5b+UqSCOT4wUOrJ0JO2IKos0/OJJPFRw+f1FaEu1LA2KiMg70pb
 4Ig7YqHg0UY+/DOP9/ELf4/dMv7jiEvPqNBk90AcNLjg/LDvaJDlmadQ+DnrVMNNILub+Q
 mjjE6dmfaEYhOzcziYzn+ACeZZp60Jg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-7JscIlS1MwKk7MRyjFJZsQ-1; Thu, 20 Apr 2023 16:55:11 -0400
X-MC-Unique: 7JscIlS1MwKk7MRyjFJZsQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f17b8d2520so6067005e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682024110; x=1684616110;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MtP5OQ73KFQelsrdnOFD+HyKiuSQs/AtcLiIzo+PL/w=;
 b=PXt16H5ESF5lZRVDUfMCC80Yf1mFdtuK8TsKl9F9O7xW247w8+DLOUapCnX3+nSgiP
 +aeW+25e0nfxcoRtK7aX8FXusbdoeh7XYSlDqqnKIv6wTl6FBrZeFPjklLH8sJ22LaDm
 fqwOSWz+rV3kzkkPGsETVR7j5Y7TQ3sNRwILgD9oO+fI9rjfrst2eOEgaXUmKjuXQTrK
 wF7GLSJBHQJN00JRS9RwGORp/j2Ff/c6pKISHZnLZ/X/dGTpB9jiwvO8lY7ODrmBKaIK
 CHSsjiWs6g6s+G4eyvkxTi4fKLcB66mOW36EyM4+/r9buAW4n6pv4NuSDo36UrKn7ELu
 sM2A==
X-Gm-Message-State: AAQBX9daxt/pxufq0uTMuncG/mf66b/0UJMsIrgOV0YT+aoi1DRpJLh7
 Gg0bM/40XeIpa9+gBPMBuzqy8EaEcFXfIhgiHyVZEPJvxoaKUph/jRmEaklS6eP94AJh2ThfmPl
 7fovoUOuXppMPKSs=
X-Received: by 2002:adf:f741:0:b0:2f8:1ed9:f0f8 with SMTP id
 z1-20020adff741000000b002f81ed9f0f8mr2015729wrp.61.1682024110172; 
 Thu, 20 Apr 2023 13:55:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350YDycL+6wQnY2gq8VDibc+3Xobg/aAP33unxFHjEidnNZ/guqHT/QjzGJCCTUdgQwREohdxvA==
X-Received: by 2002:adf:f741:0:b0:2f8:1ed9:f0f8 with SMTP id
 z1-20020adff741000000b002f81ed9f0f8mr2015710wrp.61.1682024109861; 
 Thu, 20 Apr 2023 13:55:09 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 m6-20020adfdc46000000b002d45575643esm2851048wrj.43.2023.04.20.13.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 13:55:09 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Alexandre Iooss <erdnaxe@crans.org>,  John G Johnson
 <john.g.johnson@oracle.com>,  Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Richard Henderson
 <richard.henderson@linaro.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>,
 Yohei Kojima <y-koj@outlook.jp>
Subject: Re: [PATCH 2/9] qemu-options.hx: Update descriptions of memory
 options for NUMA node
In-Reply-To: <20230420155723.1711048-3-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Thu, 20 Apr 2023 16:57:16 +0100")
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-3-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 22:55:08 +0200
Message-ID: <87v8hquvdf.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> From: Yohei Kojima <y-koj@outlook.jp>
>
> This commit adds the following description:
> 1. `memdev` option is recommended over `mem` option (see [1,2])
> 2. users must specify memory for all NUMA nodes (see [2])
>
> This commit also separates descriptions for `mem` and `memdev` into two
> paragraphs. The old doc describes legacy `mem` option first, and it was
> a bit confusing.
>
> Related documantations:
> [1] https://wiki.qemu.org/ChangeLog/5.1#Incompatible_changes
> [2] https://www.qemu.org/docs/master/about/removed-features.html
>
> Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
> Message-Id: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd0=
6.prod.outlook.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


