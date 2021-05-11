Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AD437A8B4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:14:55 +0200 (CEST)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgT9z-0000mu-1Y
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgT5P-0003Zb-IO
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgT5I-0001Zf-DH
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620742203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nb0xc0d63pI5DS5cI4ybWG+R+zulcFBB9GmQqANMu/c=;
 b=abwrNnfpuCUEMwOh8E9RG0Oskvi6rMBJNx8RqAA1rpxFzm8joVeP3wvYjKFjamWwAXGLAW
 jhqN/QATi/rrty2uEoLUxq0AuksENfw0rg4bOQkECFfMGMz/T5wA7cVAqTapqScfAW6SGw
 9YNm4REA9j5TXtdjcx4N0YuYbJT3/fk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-p6oqrGChMCGbeER97QLGhw-1; Tue, 11 May 2021 10:10:01 -0400
X-MC-Unique: p6oqrGChMCGbeER97QLGhw-1
Received: by mail-wm1-f69.google.com with SMTP id
 s66-20020a1ca9450000b0290149fce15f03so671805wme.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nb0xc0d63pI5DS5cI4ybWG+R+zulcFBB9GmQqANMu/c=;
 b=mvlYmqqS3AocgJJw0FE4fj9fIuQbXLEdn02wlqX8D0/NXP+73w+AkttYiO/BkWIOTn
 xkWG2J49KG3u/Dvftyzvc6OuquWU/HSSirzvz0fw1ao4aJ197lEZsF0ZwJfAH3qxRukf
 K1d/YBj3M2NbXD1qbDfmV3TtW91F29utw8Iq6sPMVQhEsyVCeSXCH+jzpT2xedmHXsDC
 28amb2YyANcwAnxCkkd07qwpag7MbRgVgTNl0q5Frn4E9Ophay5Vcv/lW7A5/6Cj4USV
 B0mGkOCLta1IZzEUvDWxLYGdV3tWIpxMrHMHsdg31vYbJrq556bEdOxqCPcWaeSyJO8d
 VlcQ==
X-Gm-Message-State: AOAM531QNh4hbkYohqFE742DsXtKSfJzXYgAnJhDOy00vexij7EWn5zt
 fSILf5yWS0l8XGVM+IGctvMwd8oDoMviYiJFb14dJRxVXzix/4QEEzBcoHdHYvN6fef8lSPmZ+B
 laMiKhH5H62ZbaPg=
X-Received: by 2002:a05:6000:2ca:: with SMTP id
 o10mr38203223wry.234.1620742200634; 
 Tue, 11 May 2021 07:10:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYmLlLuNRibnBiNMsIio3vvFS1WiYK8MWJ5kcey3OjCTO3n8l65RHbi1GnItQYj6YgBcvdrg==
X-Received: by 2002:a05:6000:2ca:: with SMTP id
 o10mr38203190wry.234.1620742200442; 
 Tue, 11 May 2021 07:10:00 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id n7sm27371132wri.14.2021.05.11.07.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:10:00 -0700 (PDT)
Subject: Re: [PATCH 09/12] tests/docker: drop CentOS 7 container
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-10-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <404aaa97-485f-852e-f261-e666c3c5b307@redhat.com>
Date: Tue, 11 May 2021 16:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-10-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/containers.yml             |  5 ---
>   tests/docker/dockerfiles/centos7.docker | 43 -------------------------
>   2 files changed, 48 deletions(-)
>   delete mode 100644 tests/docker/dockerfiles/centos7.docker

Reviewed-by: Thomas Huth <thuth@redhat.com>


