Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8C52F4CBA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:09:33 +0100 (CET)
Received: from localhost ([::1]:38718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgq4-00044B-OK
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzglD-0002E7-14
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:04:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzgl9-0002ke-Jz
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610546666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ENQJeRtO+8Vz8PgOFz7+XOq8Wl89ro90Ig5qjVXyxFo=;
 b=GuquMH8nbWi3HxGAPl8MCvjQmxjTNH7QBqTIvXVh2uA+Edtoac82ckRmEE2oFJlcVbAHMn
 hJn6oNjjD6qU8WTkogx/IS9j4zlTD9WPF4Wldrfqq5Vo0slXtTej+8N/HtMw0AwhmOcR3j
 4lbFUXtR6ONDbv4p++mZjg6LXc2Qb7M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-u80g_69_PZ-BZAh_sdRTWg-1; Wed, 13 Jan 2021 09:04:25 -0500
X-MC-Unique: u80g_69_PZ-BZAh_sdRTWg-1
Received: by mail-ed1-f70.google.com with SMTP id p17so889353edx.22
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 06:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ENQJeRtO+8Vz8PgOFz7+XOq8Wl89ro90Ig5qjVXyxFo=;
 b=fQjwKifvvOVjlaMoVLQ2R73fWqCM3DLxBwjxWX/t+xVhP6RalHntovFsKj+S6n7rfU
 80P3YzS9ZKlS0AhclFNhoUchCnQhIgjkpeBa8SOvVPBlEZKIA8do6SKliRDKEP3wx1RN
 gjoMNijY8uGySzSXRYTTMDHcGP5ggXuetphxrd4Tw9whzkW06TvOzrUI+RiNFsM8+7m7
 tHIEj/Cr96LuREuhZ3en+UGvWIJmLTdie5LKqXg5w1ZhV7W1KTbURfQ06EZ8yDbEv1gm
 UxFWArR8TzxI5qC0o0F6Iv3bc8dUS1PDdVBwWW5OORAbRPaN499DecTbTtxHTBi00oxV
 xt8g==
X-Gm-Message-State: AOAM532xj09LghXAczvGvDX4AqOKzdhd/kpqMLj+jYXsXug2+jTyBY9E
 J7SR6Zmb+PEXRlQuBtWZnwm9K5gHNs3N/WkQ5fEgPQazpJd864KqXkkK25d/t6FX6iqYOfynG9r
 NAeqPMfdpWf5kKU8=
X-Received: by 2002:aa7:d784:: with SMTP id s4mr1854032edq.215.1610546664147; 
 Wed, 13 Jan 2021 06:04:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOhWTm1W+bORUqTbjwzy2TOfb+MP2Nz3rFuc5P1N7Zh5onz1mFYpq+kD6okPAPDa3Lhf1h5g==
X-Received: by 2002:aa7:d784:: with SMTP id s4mr1854008edq.215.1610546663937; 
 Wed, 13 Jan 2021 06:04:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d4sm906351edq.36.2021.01.13.06.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 06:04:23 -0800 (PST)
Subject: Re: [PATCH 8/8] configure: automatically parse command line for meson
 -D options
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-9-pbonzini@redhat.com>
 <20210113103143.GA1568240@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50a309ed-64a3-6d17-9edb-6274abb4e498@redhat.com>
Date: Wed, 13 Jan 2021 15:04:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113103143.GA1568240@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: marcandre.lureau@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/21 11:31, Daniel P. Berrangé wrote:
>>   meson-buildoptions.json                 | 717 ++++++++++++++++++++++++
> I'm not a fan of seeing this file introduced as it has significant
> overlap with meson_options.txt.    I feel like the latter has enough
> information present to do an acceptable job for help output. After
> all that's sufficient if we were using meson directly.

Sorry, I missed this remark.  meson-buildoptions.json is not 
hand-written.  It is the result of Meson's own parsing meson_options.txt 
exported as JSON.

In the commit message "because we parse command-line options before 
meson is available, the introspection output is stored in the source 
tree.  This is the reason for the unattractive diffstat; the number of 
JSON lines added is higher than the number of configure lines removed. 
Of course the latter are code that must be maintained manually and the 
former is not".

Paolo


