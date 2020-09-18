Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1850C26F8C4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 10:57:26 +0200 (CEST)
Received: from localhost ([::1]:46908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJCCr-0002Oz-4x
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 04:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJByB-0002Wu-Hd
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 04:42:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJBy9-0007uP-LN
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 04:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600418530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jgp61GVN7J8od0QvodpysbGiJlU20msWYItJzLRGZAs=;
 b=FEM/2iUYujYyJH5OddcvJN0iBUNGT8va/OJe5oQUorRjqI2of7tHAVeJaluXHtu7qdMFCo
 L7EpECbR0q9leFumcPqOHB5QkG+799VCY06aNTT3+rdg+V1lZyCCkFdT3dsHpVbtcsOnB6
 wVCQ+srnnn2PzaNq+Zr9cZyNQzzqUFQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-ASyvoyMjMuaWbdcsU785Fw-1; Fri, 18 Sep 2020 04:42:08 -0400
X-MC-Unique: ASyvoyMjMuaWbdcsU785Fw-1
Received: by mail-wr1-f70.google.com with SMTP id v5so1852299wrs.17
 for <qemu-devel@nongnu.org>; Fri, 18 Sep 2020 01:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jgp61GVN7J8od0QvodpysbGiJlU20msWYItJzLRGZAs=;
 b=HbTYWmWJObFlqpeXy/sFTENiXK5yjIvNl+NBAx9+1qsVeCvydYIywsX1v7RfyS5mJT
 KtlrqBoqOqHHPqH1FGM/ipNE5vGBYymt6S12MwZYiS7QhJG7Y7b22F5/NVnjUGqX4V4C
 oIvfA3YOKh0K2bj//4HWrFniJqJ882YOONxZRRC5zLQIBzrxg2lSHbRY+M/OtJ74b2Ez
 kbkmwsOpL651BZdC/Ox3jpZ11AQfT0BhEAaMUCqVx/ZHkaCsI0WihpQzsENE9THc5S+/
 FWc3tQ97I+J/XdIkPBRLgsLFD/0Poa3fK4eeSuAqwf55v7jCdbCDkLfol35KWHQBjCUb
 W33g==
X-Gm-Message-State: AOAM531CwUkGnURWAUR8Z1z6MRoXrM7CewouMKXq0WIhivIiLtKhQVGj
 OI1og7ps4xFb1VzH5GVsBse5Mj2HTLPvxHJUcWX5CKIj1XseOpCJ1Dd/GrgvsctJPaheuwZUVgV
 5789axeGMyjpAlug=
X-Received: by 2002:a5d:444b:: with SMTP id x11mr36327986wrr.402.1600418527524; 
 Fri, 18 Sep 2020 01:42:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPpig34Vu4OOtFbBysvhEnU++JjevwNeafPARX9Nbhw0m2lh6G2hEV+x35HOXd57ZQf5fM6Q==
X-Received: by 2002:a5d:444b:: with SMTP id x11mr36327967wrr.402.1600418527246; 
 Fri, 18 Sep 2020 01:42:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:69b4:4715:609f:385f?
 ([2001:b07:6468:f312:69b4:4715:609f:385f])
 by smtp.gmail.com with ESMTPSA id d6sm3739746wrq.67.2020.09.18.01.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2020 01:42:06 -0700 (PDT)
Subject: Re: [PATCH] configure: do not limit Hypervisor.framework test to
 Darwin
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20200916081131.21775-2-pbonzini@redhat.com>
 <20200917175158.GC43363@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2883f898-b89b-b3bf-c361-47be8da465ad@redhat.com>
Date: Fri, 18 Sep 2020 10:42:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200917175158.GC43363@SPB-NB-133.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 00:20:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
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
Cc: Christophe de Dinechin <dinechin@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/09/20 19:51, Roman Bolshakov wrote:
> On Wed, Sep 16, 2020 at 04:11:31AM -0400, Paolo Bonzini wrote:
>> Because the target/i386/hvf/meson.build rule culls hvf support
>> on non-Darwin systems, a --enable-hvf build is succeeding.
>> To fix this, just try the compilation test every time someone
>> passes --enable-hvf.
>>
>> Reported-by: Christophe de Dinechin <dinechin@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  configure | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/configure b/configure
>> index b4c0e0d07c..14b06a2510 100755
>> --- a/configure
>> +++ b/configure
>> @@ -863,7 +863,7 @@ Darwin)
>>    bsd="yes"
>>    darwin="yes"
>>    hax="yes"
>> -  hvf="yes"
>> +  hvf=""
>>    if [ "$cpu" = "x86_64" ] ; then
>>      QEMU_CFLAGS="-arch x86_64 $QEMU_CFLAGS"
>>      QEMU_LDFLAGS="-arch x86_64 $QEMU_LDFLAGS"
>> @@ -5867,16 +5867,18 @@ fi
>>  
>>  #################################################
>>  # Check to see if we have the Hypervisor framework
>> -if [ "$darwin" = "yes" ] ; then
>> +if [ "$hvf" != "no" ] ; then
>>    cat > $TMPC << EOF
>>  #include <Hypervisor/hv.h>
>>  int main() { return 0;}
>>  EOF
>>    if ! compile_object ""; then
>> +    if test "$hvf" = "yes"; then
>> +	error_exit "Hypervisor.framework not available"
>> +    fi
>>      hvf='no'
>>    else
>>      hvf='yes'
>> -    QEMU_LDFLAGS="-framework Hypervisor $QEMU_LDFLAGS"
>>    fi
>>  fi
>>  
>> -- 
>> 2.26.2
>>
> 
> After reading "configure: move cocoa option to Meson", I think the patch
> should follow meson-driven configuration like the cocoa patch. That'd be
> a step closer to make configure a thin shim to "meson configure".

That's unfortunately not yet possible because supported_hvf_target()
uses $hvf.  The idea is to move accelerator detection to meson so that
config-target.mak becomes essentially constant and could for example be
moved to default-configs/.

Paolo

Paolo


