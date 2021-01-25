Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082343026B0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 16:08:53 +0100 (CET)
Received: from localhost ([::1]:47002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43U4-0007ep-4Y
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 10:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43RW-0006JI-H6
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:06:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43RU-0003zT-S9
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611587168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oFjXvYPythvzmBsRRSp9UybNAvVnq2Fwt8c7DdjoUlY=;
 b=JgrCPnGch0wpJztRlGmMjAP0u7fD2EAOglwdYoVv+AFG0jSeE0AL8xKGqDbihwT14ri9Sf
 hHcuwl3a3iC3yLtwxSWrx8Lm87cyICbHBl9L+PE+jm5xlA68D9s2YrKXFL4EzNmsNZFxlv
 Nfy4Njnc6BG3LLmVYQxh01Jqg9o+u4w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-kJ-R6DUGMt6OnN7ToOGoog-1; Mon, 25 Jan 2021 10:06:03 -0500
X-MC-Unique: kJ-R6DUGMt6OnN7ToOGoog-1
Received: by mail-ej1-f70.google.com with SMTP id p1so3888627ejo.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 07:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=oFjXvYPythvzmBsRRSp9UybNAvVnq2Fwt8c7DdjoUlY=;
 b=LrBaiHbuvtx5Y38uHbt7QSgi5Q9d6a3HrQ55LlglBcYB17fe3fu0WjTcUxAZx/bT7P
 PukO7mbNylf2xW/0WP0JDXqLM9ecAP2wyNVP5kFULCymqEmrxp2RsGEOgaymvuEtTgeL
 /RYM55kfDYRuWzFDa6pvSpjp0O2TwwFTqWsGs6wGvpO9sSnFIqmKlK6a2h0QBpnuDfJI
 xufcX2AMBb2sPpaXYyN1xgz7kyIGQ2PfDip7neV+psN0QRsNqLfU9FPAD+/Ke+RdZ2gj
 L6vxY7Q34tJuKdIF8noXUvjE+ZM5UvyxUqTG5wM2qfL0PCeAH9qzC0DhQ8MXmwykXssm
 AvTg==
X-Gm-Message-State: AOAM532VuVIKnC28lCeDE3pCRIohc//JmJmsXXNCWRd7RnsARccLyE7D
 +q7A/EzUzPlatKwKHcjVCVohg6LkI3FD7j4XCzo246R+crrAvFxv7Yb1K0G5YAKN/YDOkWphvpK
 C11jL9C/vFj+Hmsg=
X-Received: by 2002:a17:907:f81:: with SMTP id
 kb1mr664624ejc.412.1611587161952; 
 Mon, 25 Jan 2021 07:06:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJza6+JNbghUlpSi9DGneheeUvwb89EWIPDQH1y+L6GC0/rKgc6Y6s+SDvDI19HcuDus1CeKGw==
X-Received: by 2002:a17:907:f81:: with SMTP id
 kb1mr664593ejc.412.1611587161650; 
 Mon, 25 Jan 2021 07:06:01 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id dh14sm10461460edb.11.2021.01.25.07.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 07:06:00 -0800 (PST)
To: Qemu-block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: How to check when "raw" format driver uses a "regular" file?
Message-ID: <1ccc5e60-65fa-21aa-713d-d5bb575b2594@redhat.com>
Date: Mon, 25 Jan 2021 16:05:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Is it possible to restrict a block driver to a particular set of
options? In my case I'd like to restrict the raw driver to regular files.

I noticed the NFS driver does it locally in nfs_client_open(),
and FUSE has is_regular_file() -- which is POSIX specific however.

When a backend is a SCSI drive, the block layer provide the blk_is_sg()
method to test it.
1/ Should I provide a similar blk_is_regular_file()?

2/ There is no oslib function to check for regular file,
should I add one too?

Thanks,

Phil.


