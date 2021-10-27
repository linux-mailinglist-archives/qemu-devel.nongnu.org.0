Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41943CAF1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:43:40 +0200 (CEST)
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjDP-0000iY-Mc
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfiZS-0004UG-PJ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:02:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfiZQ-0000gl-Vr
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635339738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rlPGY14sqKdlPDlOxxI9zTfDZO6pYn0r/sUecTdYAg=;
 b=dVrLInkM3Dy/LYbSj5nco7YuQVT2lXahayro+aiRbI2LZgv4pg176bxtH3NwliL17VDSH6
 lmb8Xk3SSLc6PQThQv0sLP5xYEZLh39FEmzl7WT7OIcEbyHWkndnbxoluQHZ+OY73G+qV7
 K4p/vunzoBKoaNsrq5STyzOaFdJGI20=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-rZR_Ed2gPu-eDVbj9m6eZw-1; Wed, 27 Oct 2021 09:02:17 -0400
X-MC-Unique: rZR_Ed2gPu-eDVbj9m6eZw-1
Received: by mail-wm1-f69.google.com with SMTP id
 188-20020a1c00c5000000b0032cd3e3f249so489255wma.7
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/rlPGY14sqKdlPDlOxxI9zTfDZO6pYn0r/sUecTdYAg=;
 b=VPj5aezofzqdNQuheihWdJVemeSqnGhAXdKIu7ER+o+98wRreCG2mBvh2iMGSbff7v
 iqR/HlyKSgnTzIVq2wIzA6HBTQar3io2clno1EzIC5ekqKoN3j9ocEOIo/F3nJVduddj
 2RBL9ZrjmqO7Z7PcuxEYPFJhQldu96DI3Du6G0fNfRarTLeaPe8VqGXPXeAERixJvPv2
 uogCm1fCCBapPSF8+QY47ZgjE9KF/AT/RoD0SHL9X8+8KGMgxV6xLI1jYCk/MMqbH1Hc
 XW2wi72vNASJpPZ7DgSzKNE3XM93g+Qol5LDKXd3OGnBJjCWlvkNuRtUMvTwW9/7nLSJ
 A9Dg==
X-Gm-Message-State: AOAM531Avin47wRw17P6bxA7IOJ43zC3PRuuv0vnVL4tDGQffP8Duswf
 y+T2P1pJ6TutsX/h1K/Ue7NVxALc/Th26CujqRIBiHuXoa4Rfh1CGYBdNyXtH1FY/cCoNVnKs+G
 1Vv2ooq2mHkm6ebE=
X-Received: by 2002:adf:ed41:: with SMTP id u1mr11555491wro.346.1635339735974; 
 Wed, 27 Oct 2021 06:02:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOYQr9nHJLvzLtW/qvZzxv1L2ZPkShBXgDP4BZG0FRnM3Caq7NlZNhhERnZ25fkafoOtzVQQ==
X-Received: by 2002:adf:ed41:: with SMTP id u1mr11555452wro.346.1635339735768; 
 Wed, 27 Oct 2021 06:02:15 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i14sm3298484wmb.48.2021.10.27.06.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 06:02:15 -0700 (PDT)
Message-ID: <608cc0fd-3a7b-644d-0113-08ced2e8df5e@redhat.com>
Date: Wed, 27 Oct 2021 15:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/1] gitlab-ci: Only push docker images to mainstream
 registry from /master
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20211026145509.1029274-1-philmd@redhat.com>
 <YXk7nLN/rBGk+Gaz@redhat.com>
 <20211027122658.ieazn3sykshtlth4@sirius.home.kraxel.org>
 <YXlHQXWoLpvT7ukX@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YXlHQXWoLpvT7ukX@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 14:34, Daniel P. Berrangé wrote:
> On Wed, Oct 27, 2021 at 02:26:58PM +0200, Gerd Hoffmann wrote:
>>> Notably the latter is more restrictive that git branch names. We could
>>> assume users always have "sensible" branch names that are less than
>>> 128 chars and only alpha-num characters plus dash/underscore. This
>>> would be fine for my personal branch naming, but I wonder if anyone
>>> uses wierd branch names that would violate docker tag name rules ?
>>
>> /me uses slashes in branch names, i.e.
>>
>> queue/$topic for patch queues
>> $hostname/$subject for my development branches.
> 
> Ok, good to know. So that example clearly rules out use of git branch
> names as docker tags.

CI_COMMIT_REF_SLUG should work:

- CI_COMMIT_REF_NAME The branch or tag name for which project is built.

- CI_COMMIT_REF_NAME in lowercase, shortened to 63 bytes, and with
  everything except 0-9 and a-z replaced with -.
  No leading / trailing -. Use in URLs, host names and domain names.


