Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3FD2689DD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 13:21:33 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHmY8-0005vI-2z
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 07:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kHmWG-0003yJ-UF
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 07:19:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23030
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kHmWC-0007bF-Pz
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 07:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600082366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zv9Eyag0g2ZUVW7ywsVcCbHRN8LW+0Zx/h9DYWBw424=;
 b=C5Mg9Anz2KXi1rjqGLLb/NS6eqyBehTOuB7XqbyO2DECWXnTkiw6IaR79JxVekC7DMeHPx
 ML0XQn5JNX0GO5ShCJKXE8ihBxRS/18+jQrVkWPAt6uZIWTmjdlQjSmWwX9aNuG8pU6ECH
 N5EayA6kGOO3TzqrWnHiq3r6hbhFc5I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-uZLRqCtnO8GqZLdT8ZDA-A-1; Mon, 14 Sep 2020 07:19:25 -0400
X-MC-Unique: uZLRqCtnO8GqZLdT8ZDA-A-1
Received: by mail-ed1-f71.google.com with SMTP id y1so9105963edw.16
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 04:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zv9Eyag0g2ZUVW7ywsVcCbHRN8LW+0Zx/h9DYWBw424=;
 b=muQRQYpJ/z+QFj7ux3YLzFAYDl3aHh6RjGcONPnduAON/LqO6MbZDE5jpKz3g1sThU
 ZqEePPt21gpU5QqT2rZOVP5UW+C1JjGgspvYaACSaeEMU/TMnXdjyREJT7Olt1SggEKz
 BZS4rtCiLpb3dE3Bnhtrq4bHuQBc8/d8b4ifXVUoEBvnCNm2Kv/KLWprugse0Ls+8xxI
 IwDOiv/B/sdXldHM7rgrD8pHU1lPlWAkhCGSjv03m02n9Xqrd1+C9bOzM//T9Do1F6fL
 nT29jetYS8gIOYZBa5pYxYu06xbeE7Xohr5CDKX0KpuOd02TJSeg1KhKm8mxlyxYBVip
 stRw==
X-Gm-Message-State: AOAM532UWBHL65QnLFyvFtQo4rLWCuJoK8bG/PtWqAPcGDAGT8ZK2Lka
 i2ePPVwT9i/g01yJQH87QR9RSIie6BmQMO1Md8PsDzG1RK9yO3bJ/bDinWO+C8SVOa1+IL1NPRF
 danl7OPK6PpvZHf4=
X-Received: by 2002:a05:6402:6d6:: with SMTP id
 n22mr16406974edy.79.1600082363496; 
 Mon, 14 Sep 2020 04:19:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKzk0FeH5GZIykLzpxGxnI7obLhZa1p2HQArknsEzKYnMz9slvSiVFmSsECEdjOJRkM4Jovw==
X-Received: by 2002:a05:6402:6d6:: with SMTP id
 n22mr16406950edy.79.1600082363225; 
 Mon, 14 Sep 2020 04:19:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d386:a377:dd9c:9b59?
 ([2001:b07:6468:f312:d386:a377:dd9c:9b59])
 by smtp.gmail.com with ESMTPSA id l21sm7610911ejg.124.2020.09.14.04.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 04:19:22 -0700 (PDT)
Subject: Re: [PATCH] scripts: display how long each test takes to execute
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200914110948.1425082-1-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fdbb969d-6569-87bc-901a-f51d7bf2cd21@redhat.com>
Date: Mon, 14 Sep 2020 13:19:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200914110948.1425082-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 01:36:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/20 13:09, Daniel P. Berrangé wrote:
> I'm unclear if meson's native test runner can print timings. If not,
> we might want to submit an RFE there too.

I agree that any holes should be filled in there.  In this case it does,
so I think we should start using it in CI so that RFEs can be sent there.

mtest2make-style output has been in use (and good enough) for years so
I'd rather avoid piling up more hacks on top.  "meson test" is not
perfect but I'd rather improve it instead.

Paolo

>  scripts/mtest2make.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
> index 9cbb2e374d..9103ae65b9 100644
> --- a/scripts/mtest2make.py
> +++ b/scripts/mtest2make.py
> @@ -20,7 +20,7 @@ print('''
>  SPEED = quick
>  
>  # $1 = environment, $2 = test command, $3 = test name, $4 = dir
> -.test-human-tap = $1 $(if $4,(cd $4 && $2),$2) < /dev/null | ./scripts/tap-driver.pl --test-name="$3" $(if $(V),,--show-failures-only)
> +.test-human-tap = export then=`date +%s` ; $1 $(if $4,(cd $4 && $2),$2) < /dev/null | ./scripts/tap-driver.pl --test-name="$3" $(if $(V),,--show-failures-only) ; export now=`date +%s` ; delta=`expr $$now - $$then` ; $(if $(V),echo "TIME $$delta seconds",true)
>  .test-human-exitcode = $1 $(PYTHON) scripts/test-driver.py $(if $4,-C$4) $(if $(V),--verbose) -- $2 < /dev/null
>  .test-tap-tap = $1 $(if $4,(cd $4 && $2),$2) < /dev/null | sed "s/^[a-z][a-z]* [0-9]*/& $3/" || true
>  .test-tap-exitcode = printf "%s\\n" 1..1 "`$1 $(if $4,(cd $4 && $2),$2) < /dev/null > /dev/null || echo "not "`ok 1 $3"
> -- 2.26.2


Paolo


