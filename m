Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A771333A32
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:41:26 +0100 (CET)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwHF-0005Jw-BA
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJwCU-0001pt-R7
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:36:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJwCJ-0004LI-St
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615372568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZuaXm88vAJOeCyLmwfYukB4Cxd648RooAx0L+pF63I=;
 b=SWg8ieXHnRsDDxEQTG486DnL4gOPn9QQhgeQM18/dOtptfCyIL2M7nmzRSObn3x4rNy9Mf
 67alpdK0gJGeFIYCVdJCVL+naGytxosLeh9WgTgdIjYLaqhUJ11v7+rKKXvoPTLAiYFJXv
 y5b+6WDa+b7fCSFgs89dheZenql4XWc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-xS_XohkXNlqaqKvxpAEiig-1; Wed, 10 Mar 2021 05:36:06 -0500
X-MC-Unique: xS_XohkXNlqaqKvxpAEiig-1
Received: by mail-wr1-f70.google.com with SMTP id e29so7784297wra.12
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EZuaXm88vAJOeCyLmwfYukB4Cxd648RooAx0L+pF63I=;
 b=s3gdnIuG/fi7JjOCNyqXILuj9A4HnYpnbviq8n4/4GC444NDdrKp6ZnHDc9Y4JYWYP
 pij5nlDH6EXUrvkM/CJSydzhL3WDhjwv225yX0P5d1nSDBXLhlo04dC2voGHdZ0KKqwz
 q6c4T0w0JLP7iawXHj6BAGuBG4RlpkctJsQNBAhmaKjWwPVB6NxNQLAkU6+mVGKDosUs
 GTyvsrzYo2N03/HBdxXtFytGeno5UtgtZRsab5pRU4+t1EyRs360hHZ9vDmQC+qinoCz
 CEfRv1eoZPqxXwN0D3oi3hD4D9yEgo2eNw+pNrZhz8IjGjz5p7vyTmFgb4e7XfZvzfqf
 QxEg==
X-Gm-Message-State: AOAM531o7uYlaBTji4UbVSKYK+YcLgRgGOX6Avu6gLvndtWEFptKwZqy
 gQ80QjuzWTHTQHuE2sXaGFG3Y7Q+wjssBbYLoPrVJ+Bsh0lip0aEDqs9tBY4TrRPpBJtW3OJiej
 EO9VmJdMWvL9sCEg=
X-Received: by 2002:a5d:6446:: with SMTP id d6mr2753482wrw.328.1615372564932; 
 Wed, 10 Mar 2021 02:36:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRNVC4e20Qt+KfYppl/I8Z1HgUdUD2ShRoG8LgGbDPJNK9WCIl+K8jMiocrO/gHPhd1vwmzw==
X-Received: by 2002:a5d:6446:: with SMTP id d6mr2753459wrw.328.1615372564734; 
 Wed, 10 Mar 2021 02:36:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b131sm8510053wmb.34.2021.03.10.02.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 02:36:04 -0800 (PST)
Subject: Re: [PATCH] tests: Move unit tests into a separate directory
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210310063314.1049838-1-thuth@redhat.com>
 <87mtvb5mf1.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7970615e-36cf-a80b-63f1-369a7581a640@redhat.com>
Date: Wed, 10 Mar 2021 11:36:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87mtvb5mf1.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/21 11:32, Markus Armbruster wrote:
> Oppportunity to normalize the naming: check-FOO vs. test-FOO
> vs. FOO-test vs. FOO.

Not in this patch because it would complicate review of the meson.build 
code movement, but yes we should do that too.

Paolo


