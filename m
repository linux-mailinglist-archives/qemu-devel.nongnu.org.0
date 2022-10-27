Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E445260F0E0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 09:03:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwuq-0002df-9q; Thu, 27 Oct 2022 03:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onwuR-00015C-Eq
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onwuP-0007bK-Ao
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666854151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WoEvrT57z+28/vUr680tVcLQan4aLFJ66bnv9lSHEdw=;
 b=dlpyhE5Mves9H34+9JhPBYEIVmkToRuzABas0SC5O2Iuc9hgBr3aZEsvfRjWpX5g9eq/0Q
 qVIr+6eGGw2voJvdUfkD1J2tXmYvjWYNwU9uQUTTT/ulzeKqp0xMeq5DdYi2KG7Q983QK/
 246ZV+kFfAc0MdoIE7ysQX1T0KiMzIU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-pvJwJ8ktORyqF-R0OfEI-A-1; Thu, 27 Oct 2022 03:02:30 -0400
X-MC-Unique: pvJwJ8ktORyqF-R0OfEI-A-1
Received: by mail-wr1-f72.google.com with SMTP id
 e21-20020adfa455000000b002365c221b59so77117wra.22
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 00:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WoEvrT57z+28/vUr680tVcLQan4aLFJ66bnv9lSHEdw=;
 b=LOzd00hcRGLBm8x5s+/+5hU+AqdnajxnM1qNqHWPazDrBQOQ1t1i6h99vIzqHinmPD
 xwcOBnQlpFFCgPBpmqq5ZMNW1aniEEOVXk8KXNgci7FkkL+M1v/+x53WXS1VeuQ1JOa0
 an1vkmhwaj9/Tc+7BIiRIEAQYMgjCOnYtBW2r2rYdumi1E0LcWV1Kasmpaq/TvdKknab
 5W4NToLGaxNHj4x/+o/KgoBH9ZFpMsgG2arvL7/mUNkNqLjyP8Kj7ZLIYvLFf/qvWw8Y
 IypNrJak+zhyxyVsd1PMxnVUr2RnhmmNyvpThgJHOG22oAquM0RH1aVXYVMximloE9Iv
 itSg==
X-Gm-Message-State: ACrzQf0ROxsmM4irZNAps2VqlEKCXzkwvAj3cGLF6QvnCf2wM7PSI7Oa
 e0WJMgB2NJdgYEeMVwsDYDMFtUeVuYfHmH2vq18DdLx1MWK2D9lB44Do0l8JNdl5zWMPvzqC1QT
 vvzpDj2aGBz/2uu8=
X-Received: by 2002:a5d:4ac8:0:b0:236:781a:8d2d with SMTP id
 y8-20020a5d4ac8000000b00236781a8d2dmr11460929wrs.715.1666854149228; 
 Thu, 27 Oct 2022 00:02:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5k0zqB3reEC5BPdaHTyj53M6qzl2Lfvp3klmJN0P6SrawXvLPdGD3CPOpkJX96aX4SSwcXEQ==
X-Received: by 2002:a5d:4ac8:0:b0:236:781a:8d2d with SMTP id
 y8-20020a5d4ac8000000b00236781a8d2dmr11460914wrs.715.1666854149031; 
 Thu, 27 Oct 2022 00:02:29 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b003b4c979e6bcsm4113466wmq.10.2022.10.27.00.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 00:02:28 -0700 (PDT)
Message-ID: <a4fa1828-902b-5c3f-5172-b488ba53441b@redhat.com>
Date: Thu, 27 Oct 2022 09:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Amarjargal Gundjalam <amarjargal16@gmail.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com
Cc: berrange@redhat.com, vr_qemu@t-online.de,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <cover.1666707782.git.amarjargal16@gmail.com>
 <e9475aa90425b5026e031425c6dbc902abe4f3ce.1666707782.git.amarjargal16@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 2/4] hw/audio: fix tab indentation
In-Reply-To: <e9475aa90425b5026e031425c6dbc902abe4f3ce.1666707782.git.amarjargal16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/2022 16.28, Amarjargal Gundjalam wrote:
> The TABs should be replaced with spaces, to make sure that we have a
> consistent coding style with an indentation of 4 spaces everywhere.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/370
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Signed-off-by: Amarjargal Gundjalam <amarjargal16@gmail.com>
> ---
>   hw/audio/fmopl.c          | 1664 ++++++++++++++++++-------------------
>   hw/audio/fmopl.h          |  138 +--
>   hw/audio/intel-hda-defs.h |  990 +++++++++++-----------
>   hw/audio/wm8750.c         |  270 +++---
>   4 files changed, 1531 insertions(+), 1531 deletions(-)

You're changes with regards to TAB clean up look fine to me here, so for 
this patch:

Reviewed-by: Thomas Huth <thuth@redhat.com>

... but when I looked through the fmopl.c part, it really looks like this 
file is completely wrong with regards to the QEMU coding style. I wonder 
whether we should rather use a tool like "astyle" or "indent" to get it into 
proper shape? ... or do we rather want to keep it in its original style in 
case somebody still wants to try to port patches from the original sources 
(MAME)? In that latter case, we should maybe also keep the TABs here? Gerd, 
what do you think?

  Thomas


