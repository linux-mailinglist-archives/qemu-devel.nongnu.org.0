Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF9631C8F1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 11:40:31 +0100 (CET)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBxmR-00077V-1o
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 05:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBxlN-0006hr-UA
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:39:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBxlM-0002bx-8Z
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613471963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCLxUop3tlnipPey/iZ6yzYYH6DMDZ4Aim3OL/PfOTo=;
 b=MnIHPmXmotv4rHyKnAeIkkzkEGifj4SUnNmq+xO8v1K4c+x5trZRdBBm9wOVT1VwRpZ96V
 jzna0RVdBcrWNHFFmQa6+i4K1EcAiJZbN8csGd0dG+NfpqjOlUpklYAYIT+pFeXNyfuw2+
 aEmvstY0QJhAs+MAsfHEH2Zi1/p9wzg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-RjW5M9N3NA-FV9ST7VlrDw-1; Tue, 16 Feb 2021 05:39:21 -0500
X-MC-Unique: RjW5M9N3NA-FV9ST7VlrDw-1
Received: by mail-wr1-f72.google.com with SMTP id e13so10116582wrg.4
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 02:39:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tCLxUop3tlnipPey/iZ6yzYYH6DMDZ4Aim3OL/PfOTo=;
 b=iq/JuS66uZ4ZM5mQbCjIAJ5Gqk9FVBFXLwpV9FVFeGzFmu88X5jx/sBXXLy71PS882
 +IJFqp2LG4SO6pffe8FYAapeK+Tow5LgnjW2GNCmKXzXmkBzxl58SEBzlm9vtsJsmlI/
 rm/1diocxWY1QGtX9x/AYLApu1q7uDcLoJsceyAlcVvgHAnA2Pmm7ucbsOMlYJLLBb0K
 Z7QcqnjyZyXUlzYARAmzloxatQsHsVWage322H6Vw/rbb2qe/vqnCkNKQ+y1svkYIlFN
 qujW/egxvXWANKIKYW6muojQ7MFGr98CXJzueM9ZdqI9SeUNdILcM01fZyfPHTOgbwlM
 pw6g==
X-Gm-Message-State: AOAM532pDZtk7rP5qlU3BiIM7Wwz9IdFli3DQBeDn3dDhzdxUcJu7et8
 aaOg5zk/KeAnUFTcyt+q82XnOqfNzOS7MPMB2bpf3Ed+912wC6lzl+otl/UvHWskCMSW6KcYdb4
 b14UzXdpszSbAbGo=
X-Received: by 2002:a5d:53d2:: with SMTP id a18mr23390519wrw.194.1613471960493; 
 Tue, 16 Feb 2021 02:39:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyRN6BpJXkNAPqWBuDokxSQbEjDTUwI8OmXQyBiqnMwv2ThiJLrAEKO9D1EMLb5zhb7MM4jg==
X-Received: by 2002:a5d:53d2:: with SMTP id a18mr23390510wrw.194.1613471960392; 
 Tue, 16 Feb 2021 02:39:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k81sm751351wmf.10.2021.02.16.02.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 02:39:19 -0800 (PST)
Subject: Re: [PATCH 0/3] fix build failures from incorrectly skipped container
 build jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210208163339.1159514-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fb7ba9b2-622f-8a79-ae72-7d84f51f6d41@redhat.com>
Date: Tue, 16 Feb 2021 11:39:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208163339.1159514-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 5:33 PM, Daniel P. Berrangé wrote:
> This series fixes a problem with our gitlab CI rules that cause
> container builds to be skipped. See the commit description in the
> first patch for the details on this problem.
...

> There is still a race condition though where build jobs can run
> with the wrong containers. This happens if you push two different
> branches to gitlab with different docker file content. If the
> container jobs for the 2nd branch finish before the 1st
> branch runs its build jobs, the 1st branch can end up using
> containers fro the second branch.  The only fix to truely fix
> that would be to stop using "latest" docker tag and always
> use a tag based on the branch name. This would mean we build
> up a growing set of docker images in the gitlab registry.

OK this indeed describes the problem I'm facing.

> At least this series is much more correct that what exists in
> git currently.

Good, I'll test it then.

Regards,

Phil.


