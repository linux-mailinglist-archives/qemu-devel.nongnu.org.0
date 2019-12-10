Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73177118379
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 10:25:27 +0100 (CET)
Received: from localhost ([::1]:52444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieblm-0006wN-Hw
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 04:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iebks-0006X5-Ds
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 04:24:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iebkq-0004wf-Mf
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 04:24:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57596
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iebkq-0004wG-Ai
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 04:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575969867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sjxp5a68YVCtiwizlTqtDQkHPmpmKkCAg8Yt1oxCIm0=;
 b=H+fvlw6l39pruJn+7/7E05lVS4EFzw4KHpO3G+Z/ba8QQQgHRL5jH+T/RMat29FZdhPX/Y
 94FByBvvFq1EPTO29FYFJCEgL/vbFDaBI6GaNS+DpB7CYjY23on8wUk+MEDLRFDVZKurNl
 ByYKpzo/baW6HVUIESEuCKQgNvsBlfk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-bhRYqubWPPyIZgwmHOUzhg-1; Tue, 10 Dec 2019 04:24:23 -0500
Received: by mail-wr1-f69.google.com with SMTP id u12so8700073wrt.15
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 01:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sjxp5a68YVCtiwizlTqtDQkHPmpmKkCAg8Yt1oxCIm0=;
 b=b6/aN5PjzYa2KGXokQOoyt3504L//PuYKwhYqkM79+PyvkINOGPWUyfMbfEejnQvPw
 E8zp0uEz3nyz1CJZQsFAR7NDH/qppPGp4UklHXnC6utzBGcddRkw7SX/8VZx9yKfN9pS
 3ZKsnuXz6RcBEVhzOt0OkHyWnb9fLbscMGzq1YBDe5/PtnfGR5jOYCvXdPlrcN6WMZAR
 6P7W3Su6PUoQKZucH7C5aL360fs7hrKLyBCrLLxL9KN/afulm1uSlIQyvwLWVhzxIXZT
 xK+90yE9gnvicEdm4lMnkK+Pq/L1re3IejsDQY5hhWvWkbMU0Fv/111BBBN+hu2xr06X
 syYg==
X-Gm-Message-State: APjAAAVLJDj2opEK5Kkf1qNTQGm529dYupcLJdOtI5dtfngmZ1wQ34fp
 i19mld565rYbAfemhrPOJlMHdJCdyk52d7WJUYQdxBhp5+k6YOvIZQuJKa16/AqapTB7B4dGOOz
 jwhEjfAtQwX66blY=
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr3701669wmj.41.1575969862660; 
 Tue, 10 Dec 2019 01:24:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqyIg5Q6mrKd1RbtKIWuDeLfgQwGKl0Hh5RwuIYi1D4moI+bv4YigsHHt9e1D2iauKd0ionMdg==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr3701655wmj.41.1575969862410; 
 Tue, 10 Dec 2019 01:24:22 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id i8sm2541920wro.47.2019.12.10.01.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 01:24:21 -0800 (PST)
Subject: Re: [PATCH v26 00/21] Add RX archtecture support
To: qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20191014115757.51866-1-ysato@users.sourceforge.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0ce0b621-48d0-63ac-86ee-07c2fab455d0@redhat.com>
Date: Tue, 10 Dec 2019 10:24:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191014115757.51866-1-ysato@users.sourceforge.jp>
Content-Language: en-US
X-MC-Unique: bhRYqubWPPyIZgwmHOUzhg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 10/14/19 1:57 PM, Yoshinori Sato wrote:
> Hello.
> This patch series is added Renesas RX target emulation.

If you are OK to take this series, few janitor tasks I noted while 
reviewing again:

- Remove Message-Id in commit descriptions (various patches)
- Remove version notes in commit description of patch 17
- Remove 'pick $sha1' in in commit description of patch 20
- Remove Based-on in commit description of patch 21

Thanks,

Phil.


