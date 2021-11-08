Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A57447E7C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 12:10:00 +0100 (CET)
Received: from localhost ([::1]:42764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk2XG-0008QH-Mr
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 06:09:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk2VT-0007bo-JB
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 06:08:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk2VQ-00025l-1f
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 06:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636369682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mEArY41po5CW6GNSHxR99Hu1nfzDOBGP2MbHAQBF8c=;
 b=PGqKD3Abiyy4XBrUwwpdtMLD1ZQZT7TePj5ThLKREMC2v7/Z5TFhC/JafetYStKhrDbL5q
 pzMj3wucfWElEietKtELQTHfPzQlJxFtvaKIqrBCp33qyPH8/sCELAzKVgM1ccApC0kJTD
 QTT1qxa5izRqsf8d+9lk3Ik8rOyjlCo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-G_1BK5LpOxeKNTQvD7Hwcg-1; Mon, 08 Nov 2021 06:08:01 -0500
X-MC-Unique: G_1BK5LpOxeKNTQvD7Hwcg-1
Received: by mail-ed1-f71.google.com with SMTP id
 m8-20020a056402510800b003e29de5badbso14506884edd.18
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 03:08:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8mEArY41po5CW6GNSHxR99Hu1nfzDOBGP2MbHAQBF8c=;
 b=cmuixWEl654DFRAPVkmVzJsho3DdepW89QRat/FVrnRZFql5agqneSBBR1DbGf0Y6P
 gc2lBzKI8689gv18LpDFDu2nDIjhaE71dzUHHK2UaTZrnRd3p+pREvyUQRNuqBdgcl2e
 CfaPJHjI4VwZVBvoe+mhhrHxsdXOd9+Y8PmVJT6Zpde5wmrqznqMzwoGa38j2evSJzfb
 8/KrXiDQetL3VgbstzoRcNSLFgZgyZ9sEYiLXGI15MDgHSXJYaxAZSB8vl86Lx/Ibqm+
 niuTxItwnrjpKQrOP2ROSzGOaLSQYIPDELo22mY2hMbDCbRAPpT8d02zo9N6VlB8p31c
 2FBg==
X-Gm-Message-State: AOAM530L/sEZxmjpbV6KcEcY+CrHPoMd0AGxciyDaU+8c7tvRNOnicoj
 QoLsvZuBGyKa33+Og8vG1+emIZ0GwGkser95QqAUm2VN+vLmYsMDx/xQdsQ8kS1MZLdorl1XIEZ
 jq6KHQiBMp1T/V9Y=
X-Received: by 2002:a17:907:72c2:: with SMTP id
 du2mr9029775ejc.155.1636369680487; 
 Mon, 08 Nov 2021 03:08:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrE/HJtxjBltGeYF1n9gk6oqHSJ3yBVcpaA2o2JdpUdWIFCecQefdFGep76N1WRPQAwrheKQ==
X-Received: by 2002:a17:907:72c2:: with SMTP id
 du2mr9029748ejc.155.1636369680278; 
 Mon, 08 Nov 2021 03:08:00 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q14sm9102596edj.42.2021.11.08.03.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 03:07:59 -0800 (PST)
Message-ID: <9df670af-f338-c537-b03e-0b103c3100df@redhat.com>
Date: Mon, 8 Nov 2021 12:07:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/4] configure: propagate --extra-cflags and
 --extra-ldflags to meson compile tests
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211108084323.541961-1-pbonzini@redhat.com>
 <20211108084323.541961-4-pbonzini@redhat.com>
 <cad11e05-9a0a-fca4-08aa-a0ad31e13496@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <cad11e05-9a0a-fca4-08aa-a0ad31e13496@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 10:11, Thomas Huth wrote:
>> +    EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
> 
> I'd rather drop that EXTRA_CXXFLAGS line here - I think that calls for 
> trouble otherwise if a user is trying to add a C compiler option that is 
> not supported in C++ mode.
> If the users have some options that need to be passed to both, C and 
> C++, they should simply use --extra-cxxflags in addition instead.

True, but that is needed to preserve previous behavior, where 
QEMU_CXXFLAGS is initialized with QEMU_CFLAGS in update_cxxflags.

update_cxxflags does not do any filtering either, except for some -W 
options that shouldn't be in --extra-cflags.  So (apart from those -W 
options) a C-only option wouldn't have worked before with 
--extra-cflags, either.

Paolo


