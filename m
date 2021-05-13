Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CC537F582
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:20:34 +0200 (CEST)
Received: from localhost ([::1]:40868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8SH-0001It-Oh
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh8QV-00072J-9F
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:18:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh8QR-0002fW-3w
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620901118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Pa0iOKRxoZ0xa5kyYIJhB3Bpe6PwOjleNCqMyup9f8=;
 b=US2qhqElBAmEZsVyFBmlU7yNHsXA7eExoxnSKldi0LwUyOjplR6U27VIgvUmLMosCJ43D4
 v37nKc7V43DZV7LW1Mt8KSx3Ku8cwuNayd7FqtbUyuTO+J0Y0ys7XpaC8MiF0kQCrVni/H
 IyngA/tRDAjYW4QgzbA+/kYXf+GXato=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-oa2Bnmo9NJSlK9msoGy7Xg-1; Thu, 13 May 2021 06:18:36 -0400
X-MC-Unique: oa2Bnmo9NJSlK9msoGy7Xg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v5-20020adf9e450000b029010e708f05b3so7049563wre.6
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Pa0iOKRxoZ0xa5kyYIJhB3Bpe6PwOjleNCqMyup9f8=;
 b=fhMZdyl0XzbUzTIhO+9LWO5TmcoQvhT7NGvUJ4dzywUqkv5g1XrEQep6xVwxSPry7C
 cwfLfm9vtChDAR9aIMAMkUzL71Rh4wQTgDIeSw+CyRXdGwFoJpyNhjMHzGlc7+repIIe
 CqvnCLpfC7pj4JkgnjliJEgwHieHlF+kH9CiuXbGycipXd7XY4fOlXLVnG99VhxABbFp
 xi/xxePR/kfc1mQwMsivcEeQhUU2eLvfYtUKKBgvv0+JuQopHH2RUZyKBECgIXXuKPUU
 frVBx+gns2qkK1JU5Vxi3zYnRTE5lte4Yhf+Vt/mQAkAIuDsZk4NEEd2TMnDtPXiNxXZ
 5Icg==
X-Gm-Message-State: AOAM5338iRVBk0LrnJ9TkTrhyoprbshnEvd7fA/RYfBofw8hXuMmgRpY
 ZaXWvwF2wt+KGnKPXE5X/R+Qlq14q3mm3+JnNKoPBojMxCOHiXtxbhFtA+i4OLOStMR3Mmp0vXB
 nUKJi4K6sWhWIZfs=
X-Received: by 2002:a5d:5186:: with SMTP id k6mr51430075wrv.335.1620901115191; 
 Thu, 13 May 2021 03:18:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoOy8f09l+zVCr0XCmV2tg0HK1xBLhchkhztwhkP2s4hEUdLmeUZ+umB1dloIRJb5QvarCEA==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr51430058wrv.335.1620901115019; 
 Thu, 13 May 2021 03:18:35 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x10sm2422624wro.66.2021.05.13.03.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 03:18:34 -0700 (PDT)
Subject: Re: [PATCH v3 16/22] tests/docker: add script for automating
 container refresh
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210513095519.1213675-1-berrange@redhat.com>
 <20210513095519.1213675-17-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <abbddae1-44f4-0aa1-cbe1-513e1a7b6e0f@redhat.com>
Date: Thu, 13 May 2021 12:18:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513095519.1213675-17-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 11:55 AM, Daniel P. Berrangé wrote:
> This introduces
> 
>   https://gitlab.com/libvirt/libvirt-ci
> 
> as a git submodule at tests/docker/libvirt-ci
> 
> This submodule only needs to be checked out when needing to re-generate
> the files in tests/docker/dockerfiles.
> 
> When a new build pre-requisite is needed for QEMU, it should be added to
> the libvirt-ci project 'qemu.yml' file, and the submodule updated to the
> new commit. The 'make docker-refresh' target will then re-create all the
> dockerfiles with updated package lists. This ensures that all the
> containers get exactly the same build pre-requisite packages installed.
> 
> It also facilitates the addition of containers targetting new distros
> or updating existing containers to new versions of the same distro,
> where packages might have been renamed.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitmodules                         |  3 ++
>  docs/devel/testing.rst              | 15 ++++++--
>  tests/docker/Makefile.include       | 10 ++++++
>  tests/docker/dockerfiles-refresh.py | 56 +++++++++++++++++++++++++++++
>  tests/docker/libvirt-ci             |  1 +
>  5 files changed, 83 insertions(+), 2 deletions(-)
>  create mode 100755 tests/docker/dockerfiles-refresh.py
>  create mode 160000 tests/docker/libvirt-ci

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


