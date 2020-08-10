Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6428D241122
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 21:50:13 +0200 (CEST)
Received: from localhost ([::1]:54232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5DoB-0007MO-Ud
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 15:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5DnK-0006xd-SP
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:49:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25416
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5DnI-0004cV-7U
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597088954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BwFoMm/CIm54dueKoUtkxMzbktlDmxyGbs34El3U/Q=;
 b=G1+4LYmmbAnmei1EYlwCLpDY6rl5X2VFTLezI22Wjz5BFtm8Y0nk/PNR8gL16hlFZxBFqB
 +3Ikt082G6GzWr2TSciUphXF0znwKRWjdnfJpYqwNL6k75t+fmyNYUONVWrmOVqpA80/QR
 rBFDreC+HCRN1GtQ/4LMeKWX2QRYTWg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231--J-JOyJlNMa0OYGQqqBccg-1; Mon, 10 Aug 2020 15:49:12 -0400
X-MC-Unique: -J-JOyJlNMa0OYGQqqBccg-1
Received: by mail-wr1-f69.google.com with SMTP id z12so4630126wrl.16
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 12:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/BwFoMm/CIm54dueKoUtkxMzbktlDmxyGbs34El3U/Q=;
 b=O2vQHpZOjm7xk5jZGgkSxlMGtbW7lnP0zTCIoVydYe8X7+Hs6sGyRrM5Ia27J417CL
 tHM3Kexr9W/c9zedHsHtHTYvy0+TFhkiHju/9+3TN00hNI3lQxEPJbGTdqTL6NcwXfKd
 gBq8M7tLrO0xIuU5WFRjJstWgSb1bH7RHUP/X8idroCBsbt+1IpXSBb77BvTms5Tvga1
 BV4439mrfJaCYMLLVBt0uoBpI8+cQ3jUWfKpEUjXkZo5tMO/BrZkQ6HCtxKyTkMpuZi/
 mS1UAvBbgsqvrjsjbtLP52CvRDijmrs1aU7IJLZuD888Kuf5DQUVlBnD/c7uL0mt7fYp
 Xhyg==
X-Gm-Message-State: AOAM533Hm3WyTbm8GDFAioVzV3xyA1ng2kWeuODrEqHnDkPlFBegUIm9
 05qFXaoI0ArGR9qDfFxbk4lEO7I0DsbK5V5vL/lDU5lfMVZLBA4JgLnZcv79AGOlEnXvGjMC5UG
 fJ3XSY3C3Vu0MTDo=
X-Received: by 2002:adf:ed0c:: with SMTP id a12mr25626897wro.24.1597088950884; 
 Mon, 10 Aug 2020 12:49:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ6mvYbEmRRgwsDvJ5MtdgX6B50RT/CB0X/rUd6rBIIfzycdIWuUI/Mr8c2zQ22+S6+Usokg==
X-Received: by 2002:adf:ed0c:: with SMTP id a12mr25626864wro.24.1597088950341; 
 Mon, 10 Aug 2020 12:49:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d6c:f50:4462:5103?
 ([2001:b07:6468:f312:5d6c:f50:4462:5103])
 by smtp.gmail.com with ESMTPSA id j5sm1071442wmb.12.2020.08.10.12.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 12:49:09 -0700 (PDT)
Subject: Re: [PATCH 000/147] Meson integration for 5.2
To: Peter Maydell <peter.maydell@linaro.org>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
 <CAFEAcA_icj94N6eotg9W7FutXTY_6U-Ak6pJMyYH0n9eggunrg@mail.gmail.com>
 <6549f29d-f38b-0fc5-8310-e9cbedba3080@redhat.com>
 <CAFEAcA-E2iFh1bxLgRarnZWT8h-sXjENh2im4i-=56BNpNMi3w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <300b8aae-3792-9829-866f-c7e5d36c8529@redhat.com>
Date: Mon, 10 Aug 2020 21:49:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-E2iFh1bxLgRarnZWT8h-sXjENh2im4i-=56BNpNMi3w@mail.gmail.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 15:26:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/20 21:27, Peter Maydell wrote:
>> Missing dependency, you have to install python3-setuptools.
> since that's a new dependency, is it possible to make it be
> diagnosed in a more friendly way than "python barfs out a backtrace" ?

Ok, will do.  Testing if "import pkg_resources" works is enough.

Paolo


