Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88F337A905
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:22:04 +0200 (CEST)
Received: from localhost ([::1]:39860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTGt-0006uX-T0
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgTE9-0004nF-K7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:19:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgTDx-0006m2-QY
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620742738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95C69eGAdQijtmJ2tTH19PW+QPO0UX/G4p5dMzRBRNk=;
 b=BLPT0vCM+M7www9u7hXuVP7c8/+YHiz0YzlYrULib/CjBwcEvcApzVv8Gv9vtmDSxDlJx7
 KuVqsJ74rHhnTOqqttZxvltOImvj4ySV1PmudHj+H0XSF1jTfWN9M6qOu5kGKav8SSk8ZL
 KBO6DOvjVJ0Jh8ArpIv2MFQiPQLQS2I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-5oe5n1rfO8Wkzj90EtO2IQ-1; Tue, 11 May 2021 10:18:57 -0400
X-MC-Unique: 5oe5n1rfO8Wkzj90EtO2IQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so8846848wrc.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=95C69eGAdQijtmJ2tTH19PW+QPO0UX/G4p5dMzRBRNk=;
 b=ZVvXglN+WtL8SUgfYatoLTjhHfFpEzz57bXHhGQXkRPaDgomMte3mAZVvALhE0/frE
 SSbfknzBDJXTMauQB9s25ZIgBb7TyDbaof0p/QrG6T+4zzuxNKViNUemkLsdh5M7ZvYc
 Kq5LIpM5YaMy3qcyxE5PObfTn5mvzBZ+r57cRjygASIeE2q26cii6H5j0DUNR8xOtA4s
 v70Zx3Y4M+ZAYD14TcDQ0waXtpZm/rGKSUYJiaxvBWolMtdcVQ2hSYth76lV3edUxeoj
 v5NFnNF5JmqYVwauN2DDjCs+0u9+OSMJo4qRZVg4ObxwDRSunMRo/DHOY92f4DkiUfdh
 rNXg==
X-Gm-Message-State: AOAM5303C58VPr7TiWvzTdlSIsoqGvzPzKdMsZFkLbo64ouBeVfi4tnD
 er6M6lhNpWm3BhNxOpWGiA4rHvXj130+Z5HQEr4a7CySvQMAIH38tm4z6ZjmAOJY60Xm+/sf6Qh
 MGtQDNarXxrZAB5o=
X-Received: by 2002:a1c:2090:: with SMTP id g138mr32632748wmg.33.1620742736116; 
 Tue, 11 May 2021 07:18:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjTCzH2XLR1KpbpyyZq1566/v09uW20Q6XXHw4PyIiRYzsOHFhbfIURUu51tQ1v6Bsqd9INg==
X-Received: by 2002:a1c:2090:: with SMTP id g138mr32632727wmg.33.1620742735930; 
 Tue, 11 May 2021 07:18:55 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id f25sm28006810wrd.67.2021.05.11.07.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:18:55 -0700 (PDT)
Subject: Re: [PATCH 12/12] configure: bump min required CLang to 7.0.0 / XCode
 10.2
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <97e4071e-3d62-40f1-7d08-6718f2f7153a@redhat.com>
Date: Tue, 11 May 2021 16:18:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-13-berrange@redhat.com>
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
> Several distros have been dropped since the last time we bumped the
> minimum required CLang version.
[...]
> -#  if __clang_major__ < 3 || (__clang_major__ == 3 && __clang_minor__ < 4)
> -#   error You need at least Clang v3.4 to compile QEMU
> +#  if __clang_major__ < 7 || (__clang_major__ == 7 && __clang_minor__ < 0)

__clang_minor__ < 0 is very unlikely ... I think you could drop the part 
after the "||".

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


