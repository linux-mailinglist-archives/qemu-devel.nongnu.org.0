Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AB32B5E01
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:10:24 +0100 (CET)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keysR-0004ou-Dv
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keyqk-0003h8-OA
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:08:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keyqi-00032s-NX
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605611314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4N8kfNNa/UVNsjQUdQQjlzs8wVkFY65O566zczNrsd4=;
 b=hFCnCPnYfv9WzImwcU0ffCQQ5+3ptw0qGORWLMWnS/nTe76FLmz91XRQYRNwfsF41+DOSN
 ny6JnEYav3YkvEnC+fZ8OXfUw35pT2k6C82LLD45iYqSaewOvMD14O0xyHMPZu57zjQBIJ
 8BN6MsaQ8D1aq0iWU84xWeEtaYyIKwM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-Bd9gI5CQP4Ci6z2n8_OELA-1; Tue, 17 Nov 2020 06:08:31 -0500
X-MC-Unique: Bd9gI5CQP4Ci6z2n8_OELA-1
Received: by mail-wr1-f72.google.com with SMTP id c8so12890342wrh.16
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:08:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4N8kfNNa/UVNsjQUdQQjlzs8wVkFY65O566zczNrsd4=;
 b=XB0J8vtVt12MM/Y0Ow6DMmvipitTDTCutc95LnnfTQfiwl435heKv+kVRAG0R/PVUs
 Bf8UcrRlmtl8cH0e6yeN5qRMLuKdkWh/aEUVXAtM4v1KiiIssMm34COj2X/qZ+8piH2F
 tcm5tgeNAPtvCWi1/zJrjiZcq1KH0USL6+iyX/hHfOwxK599SNKmmqDyb98PYHm9Dkaa
 w40PaDYmB53OxTTpx339kGnuPeTMbSXknQG/mezBiPv2FoqcASdH5Mh9xYCJNTDryl49
 +5w9gM4yPmn/ymxE0vacoHytsh98U7lzDEa/9zggJQzjGYYwos+O4XEP2sTiKsM1WIil
 kQwg==
X-Gm-Message-State: AOAM533mAcHTM73eqiC0npFCY3BC6/0xSMFPsOhFljj/ScQFywOOORXw
 btWxpWr6sOq9sk63UobdtZKlN5Vc/8dWTt5oUlO5QMZr+6vy7Y1g6DOkrhUowR6RGc0PxCI80LQ
 W5EX3o7Y3HutwQrtVLoSJLBZz19xGlFcPbq0kYvZJNfd9OX/B/crG29qHY3yTeCLhabI=
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr3598930wmj.169.1605611309455; 
 Tue, 17 Nov 2020 03:08:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLK5x0GzapnXO/fed5KqSrMJXH6sYzOmLnP35UhYRxIJok1bYYGXC3BvR+PfgvOaa3FY1bNg==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr3598905wmj.169.1605611309173; 
 Tue, 17 Nov 2020 03:08:29 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 90sm6737411wrl.60.2020.11.17.03.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 03:08:28 -0800 (PST)
Subject: Re: [PATCH] python, tests: do not use short-form boolean options
To: Markus Armbruster <armbru@redhat.com>
References: <20201113152035.1459107-1-pbonzini@redhat.com>
 <87v9e49w5s.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a4c8c4c9-c9ed-4043-c257-993caeee29ed@redhat.com>
Date: Tue, 17 Nov 2020 12:08:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87v9e49w5s.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

On 17/11/20 10:20, Markus Armbruster wrote:
>> -            chardev = ('socket,id=console,path=%s,server,nowait' %
>> +            chardev = ('socket,id=console,path=%s,server=yes,wait=no' %
> 
> Let's stick to the canonical 'on' and 'off'.

That was on purpose (for extra coverage and not just because variety is 
the spice of life).  But I can use the canonical values as well if you 
prefer.

Paolo

>>                          self._console_address)
>>               args.extend(['-chardev', chardev])
>>               if self._console_device_type is None:
> [More of the same...]
> 


