Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888C430A870
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 14:18:48 +0100 (CET)
Received: from localhost ([::1]:35334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Z6M-0007xL-IW
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 08:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6Z3g-0007TR-Kc
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:16:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6Z3X-0006cA-8r
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612185349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5CUShisQxH8FbDdakNNZlZK8JIA9SCWbkZu7G7DzP0=;
 b=BUemAgXOIGS6MT/FpGJK+FlfhRctEu0i1RDeGRCf+g6rbtvHNhcn7tzgSX/XlkU13eJ5DG
 AOgL9cEmv0kMPhtuiXlxISl8fpV0czjCXQcBb/t29eooDs7w0BotClzV2AsNwYpk8AYe4e
 rP3cRHMtPWe2o82GMYUxN7SwQw5trKI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-b2HxJYHPOZ64s_KBx8cSHA-1; Mon, 01 Feb 2021 08:15:45 -0500
X-MC-Unique: b2HxJYHPOZ64s_KBx8cSHA-1
Received: by mail-wr1-f72.google.com with SMTP id n18so10375154wrm.8
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 05:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e5CUShisQxH8FbDdakNNZlZK8JIA9SCWbkZu7G7DzP0=;
 b=qaX+ewhU3hL8DlsnUZHwGzugCXVh/pDRuucl31ehdZd/oW3f3EDRAU4fTE/NJvf/Dk
 f4AMad581QidjGuR50x8M7h8BACWCw3+AajYFlr8UmiBb9JR7JkNgyJDyVdHIJEib4+I
 7mRb3I0tCPKl6ci5iNB3T3bI/CihKW5sCYWJ7cVJNNgBmSag0wieJd+4yYYhsdJS47ku
 s/ddcGZJRvnDrob3Vh5UKwtsmShWb9zaPoz/SdzWKFtqLZ+FOUCL12Zx/6qyIekIuEx3
 e9X4OckWE0K4xV7O7L/zjsAtUw71Ac7gIU9s8kLT0wUnzngjke3L1colG4QhnoGnBVY4
 hdkQ==
X-Gm-Message-State: AOAM5336aH0Ca+P86f2eC2EQCChUaeTgw6NCIpkTegdJKB0rV05PhxTx
 69DwLTcvGId9c382qJORSdpNNZ+mea86oPooLLy4FvmeMqZ0+QnW/mI0oBvyovpVPb6TnI/Gz/t
 OGyPckJYAWkU0QQs=
X-Received: by 2002:adf:e642:: with SMTP id b2mr18273967wrn.221.1612185344599; 
 Mon, 01 Feb 2021 05:15:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylkfzgBEKx8FLzJAF1Nkd5AhQnF/dke0N7LQ+GHHFfF5EXAnXCuXfltOL4HiQ/CT8haPgopg==
X-Received: by 2002:adf:e642:: with SMTP id b2mr18273954wrn.221.1612185344419; 
 Mon, 01 Feb 2021 05:15:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o9sm27878349wrw.81.2021.02.01.05.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 05:15:43 -0800 (PST)
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <3475760.T70ipHyFzN@silver> <20210201102426.3a3623c7@bahia.lan>
 <3962897.vStEPALNoS@silver> <20210201132649.6db25cec@bahia.lan>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: 9pfs developers docs
Message-ID: <ca497b43-bea4-14be-f49e-6b8c374da4d5@redhat.com>
Date: Mon, 1 Feb 2021 14:15:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201132649.6db25cec@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/02/21 13:26, Greg Kurz wrote:
> Is it that '-m slow' doesn't work when running 'qos-test' or
> that 'make check-qtest SPEEP=slow' doesn't run the slow tests ?
> 
> The latter was discussed on IRC last year but I don't know if
> anyone has tried to investigate this yet.
> 
> Nov 24 11:36:53 <groug>	th_huth, Hi. FYI it seems that the meson conversion kinda broke 'make check SPEED=slow'. Test programs aren't passed '-m slow'
> Nov 24 11:51:42 <f4bug>	th_huth: do you know who uses/tests SPEED=slow?
> Nov 24 11:52:03 <f4bug>	th_huth: I thought this was a block-related feature
> Nov 24 11:52:44 <groug>	f4bug, it is supposedly used by gitlab CI
> Nov 24 11:52:59 <groug>	.gitlab-ci.yml:    MAKE_CHECK_ARGS: check-qtest SPEED=slow
> Nov 24 12:50:53 <th_huth>	groug, I'm also running make check SPEED=slow manually sometimes ... I guess that got lost in the conversion to ninja ... bonzini, did you ever try?
> Nov 24 12:51:03 <bonzini>	no it shouldn't
> Nov 24 12:51:21 <th_huth>	let me check...
> Nov 24 12:51:40 <bonzini>	ah, the tests are chosen correctly but -m slow is lost
> Nov 24 12:52:02 <groug>	yes that's what I see
> Nov 24 12:54:04 <groug>	bonzini, missing bits in scripts/mtest2make.py ?
> Nov 24 12:54:28 <bonzini>	groug: sort of, but assuming that all executables support -m slow wouldn't work
> 
> Cc'ing Thomas and Paolo for additional details.

Basically what's in the IRC log is still true.  I'll look into using an 
environment variable "SPEED" in addition to g_test_{slow,quick} in order 
to restore SPEED=slow behavior.

Paolo


