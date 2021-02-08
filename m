Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B312531429D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:11:34 +0100 (CET)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ekn-0001F0-PI
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9ADa-0008OJ-MD
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:21:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9ADZ-0008R1-73
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612804856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/lbiSlEfcTzGhqyN46TBgAhg5DuLQbpImwPelklz58=;
 b=QK89Aq6h/+e2nSb8n6UDCPYRn9D0XXNwyJk/Tev2HN0Ymc1XuTWrmkFIm3pWHOzyUQ3g+w
 RaK4Bc2BjvzOPsi5/viCf5efBMF9Gjx8VE/ae9YU0piOfuk3rpHpw/ZfR3ae95TJOtv1LM
 RB3htvY0tuEnu/aJCUo340BOTqOIJaM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-dddG-tvYMcqzcxkTqKhXIQ-1; Mon, 08 Feb 2021 12:20:54 -0500
X-MC-Unique: dddG-tvYMcqzcxkTqKhXIQ-1
Received: by mail-wm1-f72.google.com with SMTP id t128so5927991wmg.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c/lbiSlEfcTzGhqyN46TBgAhg5DuLQbpImwPelklz58=;
 b=lP92i2bqU7tJoIcm5fgbtPsbuBn5chP5w8ZC00PB4zWdQfonuBfRXkJDJsIzl5exaV
 20JD/WTLgjy04bP8KZIVfrz8q78ltdpY+YsDBqaM2tQOX88OLpVjL6OnV60L4PrgoBCf
 PQ7UlhinpnEFRdlk3aLgo8IN2gAEL0NJaS21wW3wDOprA2aDCtbqfr9LXUFDpXVfhXeL
 scV3hZkHGVC+QsvRjbXWVP9J0dSBwffrfblcWo2ATZ8SWjDj1kR519tyrbH/CUTFrm/m
 cV/AvH2Awl9AaKyBmk9WBoWjm3s9vZJ0RXBEoA0o7+Tz0eMMbZooWUEBQ7dk8VCZi6Ra
 Yi8g==
X-Gm-Message-State: AOAM530mprzHnCEFyUiDIraI1xXIK5WSokFbTjlk57aD7goJoDVgoe2W
 bK0rzrEVtHnRWEw4kklUT5CxGNkJA16xhuOGsUrOXQKoal6H1x6AU9q0rmfHdC4T0I4NRUSdv5m
 czGY2k75HwBCMy+w=
X-Received: by 2002:a05:600c:4a09:: with SMTP id
 c9mr13404265wmp.91.1612804834809; 
 Mon, 08 Feb 2021 09:20:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaBEdM+RPvVJDxDidGbVOLHdGXiQHEBvJ6GFyZzNuzjQyEzGmKNGE4eezhwM21n6kDCodrKA==
X-Received: by 2002:a1c:545d:: with SMTP id p29mr14919743wmi.54.1612804823086; 
 Mon, 08 Feb 2021 09:20:23 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h13sm15741137wrv.20.2021.02.08.09.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 09:20:10 -0800 (PST)
Subject: Re: [PATCH 3/3] gitlab: fix inconsistent indentation
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210208163339.1159514-1-berrange@redhat.com>
 <20210208163339.1159514-4-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d749b66c-7072-bc60-b205-db299236ffbf@redhat.com>
Date: Mon, 8 Feb 2021 18:20:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208163339.1159514-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 5:33 PM, Daniel P. Berrangé wrote:
> The standard is to use 2 space indent, not 3.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitlab-ci.yml | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


