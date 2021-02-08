Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614FC313DAC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:37:28 +0100 (CET)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BPb-0000Kv-D2
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l94sL-00069f-EC
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l94sI-0005Q0-NS
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612784318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kol6bVs24zllNno/q8TlcRUvHDvULub8ar8p9hW3kk=;
 b=i0G87TsSFCwAcuwOPgsmUbKrZUNLYhjpnUYKlKng10P8EMTk3dpBJKaZFHdANOdMETilac
 +c/OeeHtsHiXdlIPc/gcqPEkntmSguMQ3MMieCNMFS7r129o9b+4FwpO7WuY1MLyc9d1xU
 UgDTTIa7UBv3N4TSbn73LPeMZX/APAQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-PMOevGXvMPWx6BK7UlA91A-1; Mon, 08 Feb 2021 06:38:36 -0500
X-MC-Unique: PMOevGXvMPWx6BK7UlA91A-1
Received: by mail-wr1-f71.google.com with SMTP id d7so12920640wri.23
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0kol6bVs24zllNno/q8TlcRUvHDvULub8ar8p9hW3kk=;
 b=jghtCTXhmzboPpTpdeeFpP/pbUVbmB6hO01B7QBKH2xo9fUMlARwNtmJSnnrds8wyu
 x08yxqAY6vUShekfobwL4Zb2rmVpCpcBIcci5aLvk/qRFBwtCFMTsytMs8jAA7H9sE/6
 5rh354p9lSqH3S1l8tfJp8YdEoZ+TYF2mdR2JMrJ+Xknak7PEzcUzKNMXdrv9pxOoxFU
 3NEqvgqWFXqBnvvCv3p+MWtXRXz97m/vvu93IJuPA5I31d3AN1U6y/IIA4uUlIA9HeqY
 sPzlae4cDJZ2p+rJb9Vj23nyO9pdsQ3js5lpBqHjFU3SKAtHUbwrzKXrM3iMeMayQAjN
 N48g==
X-Gm-Message-State: AOAM532zNaPcLI6C5+AN5txpJQ6BSmU1c/R3NmVwZciRS5qh1Ui5XAva
 uchkWWtruH1VomtcZ2EBAQ1FMOGUySBH9Z5Uvz17sXJOn9XfYemN/bKRSGNI0y+sHTUXiEMykPz
 KKK8KNJgypN5qmYQ=
X-Received: by 2002:adf:9031:: with SMTP id h46mr19538572wrh.19.1612784315546; 
 Mon, 08 Feb 2021 03:38:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6edl7osy+SIbN4dfC7eFHSwXm0U24C8FsAIO0rLzy0coGvdSTvquWZj2Gz6ORsMs/30ZgpA==
X-Received: by 2002:adf:9031:: with SMTP id h46mr19538566wrh.19.1612784315443; 
 Mon, 08 Feb 2021 03:38:35 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o14sm26511972wri.48.2021.02.08.03.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 03:38:34 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Add gdbstub.h to the "GDB stub" section
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210208113729.25170-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <92d37db4-55f0-9eb4-9b6d-fcfc40781163@redhat.com>
Date: Mon, 8 Feb 2021 12:38:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208113729.25170-1-peter.maydell@linaro.org>
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 12:37 PM, Peter Maydell wrote:
> The F: patterns in the "GDB stub" section forgot gdbstub.h; add it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Noticed this because my recent patchset which touched gdbstub.h
> didn't cause check-maintainers to add the gdb stub maintainers
> automatically.
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


