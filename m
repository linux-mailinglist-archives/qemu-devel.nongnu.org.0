Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EB930FFCA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 23:01:52 +0100 (CET)
Received: from localhost ([::1]:45262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7mhD-0007HB-Qi
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 17:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7mfK-0006ZF-HN
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 16:59:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7mfI-00013T-VX
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 16:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612475991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUZPs+670qixOFz9NTFNguQ5NNhI/rTpoOSmCe/uYdY=;
 b=ckPofFmt+A0ovjt2s2/w4iexjxzvU7rJo4pBERQNFJtE8ZfhCWXnmYZxFtxqt4scKmFCWL
 WTE5QHPfQCF89CZ5QfV56NJUwezx1mEQUb5eS5oaljJldKne9Z3fP+FATcIBlP6OTeSUMf
 5O3mtkgJd4TRHTGjv69Q793L58agZuc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-93CIh8VwMGWVsjDuHyZwNQ-1; Thu, 04 Feb 2021 16:59:50 -0500
X-MC-Unique: 93CIh8VwMGWVsjDuHyZwNQ-1
Received: by mail-ed1-f72.google.com with SMTP id i4so4390628edt.11
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 13:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JUZPs+670qixOFz9NTFNguQ5NNhI/rTpoOSmCe/uYdY=;
 b=gasdhXT0+WPzXncnh+WTTuBAgdlC9Boc2XLD9HnDlIYzYyyl0RXP2DXvVOW5Kpr4o5
 P+RkGV7F7/VzDx2iob6S75r3wPjcokKoglnvhA+jYJbwYWhNhE/jp4522grMjpl06WFI
 kAFt00ihvgmUNfmfQaW48Cma/ak2sVE9qwC9zLbzPVXrwB8apgGcJbj6GONi891KREgX
 JViYifm9eCvCaQRziWPOE64lCPt36cbJwA0wrnshBLvdsQ3zwRIlzM7U1zlic13D3kea
 YIVvhyL6VY4R0cbMUBi9f0pJry+zTemn4nyVMZDPub1zz6XA7VH9VcUaOI+AcKDe1Cb/
 HzhQ==
X-Gm-Message-State: AOAM5328+xfqaWxF0v1zavH5Bi/G8VBY2E8XNGX35/JN3Xp+ZD4lkigd
 +H/dD2EVh/PxI55Ke1shTwMP6BOFlZnx8b82T1a6O415BpNE8FKbzKSiDp3r1E1HKsopVTSmZNH
 1xZnPUkJe45flZqw=
X-Received: by 2002:a17:906:860e:: with SMTP id
 o14mr1131593ejx.19.1612475989194; 
 Thu, 04 Feb 2021 13:59:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkOigR2K6RB362/0xbdnHbdZTGhSXIfySFwSIhG9RQ2spZX2CRw4JLq4FWXiLvLNpLViSNQw==
X-Received: by 2002:a17:906:860e:: with SMTP id
 o14mr1131580ejx.19.1612475988947; 
 Thu, 04 Feb 2021 13:59:48 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id u16sm3077177eds.71.2021.02.04.13.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 13:59:48 -0800 (PST)
Subject: Re: [PATCH 03/33] migration: push Error **errp into
 qemu_loadvm_state_setup()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-4-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7b4c9d66-5b91-d914-dfe6-bfbecab25727@redhat.com>
Date: Thu, 4 Feb 2021 22:59:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:18 PM, Daniel P. Berrangé wrote:
> This is an incremental step in converting vmstate loading code to report
> via Error objects instead of printing directly to the console/monitor.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/savevm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


