Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD4495CCE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:26:49 +0100 (CET)
Received: from localhost ([::1]:48602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqC0-0006UD-S9
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:26:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAq5q-0001Kh-Pt
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 04:20:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAq5W-0001be-6Z
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 04:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642756803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=on9sLU6tsbdr6i5LM+2E8l/GaI8ehU9R3zhz6Af1VW4=;
 b=WCNCKPnJeBBUtjg+KwDXfVgwVdMuj+2DCsTTK5EGqh9NF3jm9FIh7G2H4gpbqvKubJLc7Q
 pfpY0yjW9YqaO5XFMjpmDKmEhS3QMXIYgoOc+CU16bzntU9X/PVfkVInHFP5dh8uz53OBG
 GawLuPNcmE2twtn4U4j4is9VbxGugLg=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-nhYw00YGOWOxhY6z0kjqWg-1; Fri, 21 Jan 2022 04:20:01 -0500
X-MC-Unique: nhYw00YGOWOxhY6z0kjqWg-1
Received: by mail-pl1-f199.google.com with SMTP id
 a14-20020a170902710e00b0014ad8395c0dso1499950pll.21
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 01:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=on9sLU6tsbdr6i5LM+2E8l/GaI8ehU9R3zhz6Af1VW4=;
 b=6udHAuZpbHs7v1nFVzsP/tcUJTQiTkHeKQ++f8ZLx4JeHfKkSx4DPNVMNZkFMdJl9p
 CSgV224G3ULNsHLzk4GjbPKllkdmz5/hOPWoeYHY1liFzQBiN2iCpH3Tq3pucDJclMEy
 yGoN5hf3scKQdsZRXEtr7UoB0jK17MK3i8FgszAcMkBaPSzLV9oGEuDnN8grF1i0r8kb
 iMUOt0cEee4NGMMzDEObX2jPWJl41FCMoiW0GMteccpjh8W9lvi7MhnU9gVr4HEYtvO9
 pRCTCoqG+xfGJaiBbwkvGt5OdWFXtGL4P7HrTr7Af/lW5Vj2Az+cCiee1XEJiHSvh6NG
 XkrQ==
X-Gm-Message-State: AOAM532UelS/j7WbGz/WU3xGQKW8vkzzSwJji/wCbirKbhN/gR3iVgDG
 WfFwIER94kVT4hUXNvD278YmkoI79ow/ah17JonbpVCnErlOoN8I54MWnatbuBWvuzyvhJGWzKB
 vBRQXEaaUBdgiocI=
X-Received: by 2002:a63:6c01:: with SMTP id h1mr2350565pgc.233.1642756800786; 
 Fri, 21 Jan 2022 01:20:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpRx9SAVk27MZg7VAHLPSgrWPpfQqrY0SHQ4/J4Q/5ROTtcLGRfLpTiqeHiHttxO8Zr2fU4A==
X-Received: by 2002:a63:6c01:: with SMTP id h1mr2350541pgc.233.1642756800531; 
 Fri, 21 Jan 2022 01:20:00 -0800 (PST)
Received: from xz-m1.local ([94.177.118.81])
 by smtp.gmail.com with ESMTPSA id f12sm1566131pfe.204.2022.01.21.01.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 01:20:00 -0800 (PST)
Date: Fri, 21 Jan 2022 17:19:52 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
Message-ID: <Yep6uDy+vq/8hzmi@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
 <f6d0b94c-3357-71dc-f992-b6d3d41fa6a7@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <f6d0b94c-3357-71dc-f992-b6d3d41fa6a7@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 04:07:24PM +0800, Hyman Huang wrote:
> Hi, Peter, i'm working on simplifying the algorithm.
> Current throttle logic is like the following:
> 
> 1. If error value(|quota - current|) less than 25MB/s, we assert throttle
> already done and do nothing.
> 
> 2. Start to throttle if "error value greater than 25MB/s" scenario detected
> twice.
> 
> 3. Speed up throttle via plus and minus linearly if "error value" be found
> too large.
> 
> 4. Throttle normally via plus and minus a fixed time slice.
> 
> I think 1、4 are basic logic and shoul not be dropped, and 2 could be
> removed(i take this from auto-converg algo),

Agreed.

> i prefer to reserve 3 so that the throttle can response fast.
> 
> How about this?
> 
> Could it be possible that i add some comments in dirtylimit_adjust_throttle
> and not touch the logic? I test the result of v12 and it seems working fine.

I only worry that the differential part (step 3) makes it oscillate, and that's
what I hit.  Maybe it can be tuned so it'll not happen with general use cases
then I think it's perfectly fine at least to me.

-- 
Peter Xu


