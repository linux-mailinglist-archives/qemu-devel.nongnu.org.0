Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC942AF576
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:51:12 +0100 (CET)
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsOt-0004Fa-SN
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcsMn-0003K5-3b
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:49:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcsMk-0005wx-0p
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605109736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Y31zTjlyd3DCQaFAbwGwCThA0BBsxz/4grF49uz7bU=;
 b=fziD98np90sv7qPAz599V4T9qD3I+TU24g5SfTEnWF0lA00pP632rJb3cl1RHwKm8BLUNq
 RqN8qv6iOsxAtMZr+/G7ooZ4BJbVlSlLj0d/+fCFP8HdjRw7aT5PgzqTOLnqnjL7+PS546
 GDh/SK5KdoPmfBIYSFar1rSSKFZ/txo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-WpddumL2PT6KbhItcn-A0A-1; Wed, 11 Nov 2020 10:48:53 -0500
X-MC-Unique: WpddumL2PT6KbhItcn-A0A-1
Received: by mail-wr1-f71.google.com with SMTP id 91so580916wrk.17
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 07:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Y31zTjlyd3DCQaFAbwGwCThA0BBsxz/4grF49uz7bU=;
 b=m6UjDDTPLqgBBvYD1YWqOl/38ULpFH+BnAXvcUdoT3VIz1l3gCYHj7fb+GoBtRwO/T
 gA5fnJYAcfg/Wd14VbCRlF2jjjq9/oGjEveI0lRjAe2h6AWiU+U92651Bymvx10xvY3I
 34NQuS7j9TshiBZH1M+TnX7HKt6ljgy53RJ5WNZbO5ODMwY2P34SayCOpm4iODWrEMqd
 f8UbmgC2vRydLEfJ58XXNyb/V9Gf2CSTpCiQE1ZMNcKySCQLJLOCLtwGPvDfmPyXwJeV
 G3cvLSS/xB9dHXM85ffwFs4zt5UyjgBdyti/5ak0IYRRxCAeFDJFSNOO6IUh0b0IWf+d
 lc1Q==
X-Gm-Message-State: AOAM533rZcud0BOa/yY9k1O9Qr774giavJ0lHh92+pJzLWTb45YiIplj
 zeWo+k1fZkdogYUz0wP8yDzo3TPdJXijCmMeW/uKGbfG19oiNe9pt8Xkf74DgnBsYmWec5u7hXI
 W0chwOcidZl42OL6oB01B/Iz3fxffH9G/k9LRIEKqNC/2n0h1tVGiJgbR4N9f3V2xqEY=
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr31382737wrp.156.1605109731660; 
 Wed, 11 Nov 2020 07:48:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpUTuslApd9Pw49oW9kSLlBefl+qg9lKR2s0aVDKAkTP7p38hxAunBGwtf5GNIH2cIVCFT3Q==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr31382713wrp.156.1605109731427; 
 Wed, 11 Nov 2020 07:48:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p4sm3265808wmc.46.2020.11.11.07.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 07:48:50 -0800 (PST)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201111135716.1209421-1-pbonzini@redhat.com>
 <20201111150336.GF906488@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vl, qemu-config: remove -set
Message-ID: <a210eaa2-6d2c-0d7c-d7e3-96c73acaf6b0@redhat.com>
Date: Wed, 11 Nov 2020 16:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111150336.GF906488@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 16:03, Daniel P. Berrangé wrote:
> iotest 068 uses -set and qtest vhost-user-text.c also does
> 
> IOW, it looks like it is valid to use -set, even if you're not using
> -readconfig.
> 
> Libvirt doesn't use -set, but we've had users who make use of libvirt
> command line passthrough for QEMU with -set.

Hmm, indeed:

https://patchwork.kernel.org/project/qemu-devel/patch/20181218041625.24969-16-mst@redhat.com/

> IOW, I'm not convinced real world usage is near zero as suggested.

Yes, perhaps it's not. :)  Though for both tests you pointed out it's 
even cleaner not to use it, there seems to be real world usage at least 
with "device".

It is probably more viable to deprecate or even forbid usage of "-set" 
with anything but "device".  vhost-user-test.c would still be affected, 
but it's a relatively small patch.

Paolo


