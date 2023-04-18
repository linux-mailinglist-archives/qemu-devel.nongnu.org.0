Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F326E6414
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 14:46:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pokhk-0002qC-Vb; Tue, 18 Apr 2023 08:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pokhi-0002pn-IU
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 08:45:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pokhf-0007iO-Og
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 08:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681821898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aIH+gCq+LDsNH49eQpYJG0sMQuXDrcNRmfBKV445pqw=;
 b=HLLUqHeK1RMiX5BIGwGy13E12CV6UkdpY8mat4ZQbOsaiBf+kpe7RUCZHtEB9+3S2UXi+2
 4XqPI5KqzkdVCtBa6LxgsbTS5ZhSXBPtZQS2HsJnYdmg4MjZ3nuKwm8S8dr3PVDXaBwR02
 qoigmp/jaf96UTio3+Dxn4dccf6PZjQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-Ug9VlVCFMTu1wfM9qpqj0g-1; Tue, 18 Apr 2023 08:44:56 -0400
X-MC-Unique: Ug9VlVCFMTu1wfM9qpqj0g-1
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c4f1400b003f0a04fe9b9so6356906wmq.7
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 05:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681821895; x=1684413895;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aIH+gCq+LDsNH49eQpYJG0sMQuXDrcNRmfBKV445pqw=;
 b=LacfK89zdV+cOk/MQMajBwfjk1GdBJPUPO0MjtAGsqZ10Cn066qVcIWbJyH5wXdzKj
 qOAb2JEyy5xu+ofK83CCewxUh/EDMWyDITzcI0orqU0gll+ytjFTsVhWD8aOyspEbhcX
 tr/nfWW2oQ/cOTsEVzXYyhazUnjEAgL5CPC83QSUmuUDXsYZvGP9/Oazg+Vo5gLW2bft
 fciPSVIv6qoIzrxX7t0Prlrv2p8NPb15GMU86kEd1kEzVjsa5CKjwkZf4H/tE7MnVh2x
 H9uvOUUSocAPd1AXmHih5zZpmNMREASooyYWCc/MksbMjQdJ0mY8Rp/8KCOMlnEaQppu
 2QUg==
X-Gm-Message-State: AAQBX9c8kWTtjr9GKqiEcni0My16ke3gyBNmtEpsBt4AFcmIv/kUJKmO
 Le1C6kvCHTlCyoOF84MBDB2Pq4XyaxB6lt7nlDDVhx7On03cd+E7yYdELT6+5cUmo4uYuIUjK26
 DF74G/hdXjScPmV8=
X-Received: by 2002:a7b:cd07:0:b0:3ed:c84c:7efe with SMTP id
 f7-20020a7bcd07000000b003edc84c7efemr13002074wmj.7.1681821895782; 
 Tue, 18 Apr 2023 05:44:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350b5hXoBxLdup9VyyGdbkqmQOo/GiJypduCgEf+FLHfiCv6R8brZbahSuzWKxApx/669tAuadw==
X-Received: by 2002:a7b:cd07:0:b0:3ed:c84c:7efe with SMTP id
 f7-20020a7bcd07000000b003edc84c7efemr13002059wmj.7.1681821895497; 
 Tue, 18 Apr 2023 05:44:55 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-59.web.vodafone.de.
 [109.43.176.59]) by smtp.gmail.com with ESMTPSA id
 n19-20020a1c7213000000b003ee58e8c971sm14785636wmc.14.2023.04.18.05.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 05:44:55 -0700 (PDT)
Message-ID: <44abaed4-465b-38c7-8d98-ed774b1dc478@redhat.com>
Date: Tue, 18 Apr 2023 14:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] tests/migration: Fix migration-test slowdown
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230412142001.16501-1-quintela@redhat.com>
 <3a601ee8-15f0-39ec-3436-69ecc5b25886@redhat.com>
 <874jpd2z7s.fsf@secure.mitica>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <874jpd2z7s.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/04/2023 13.42, Juan Quintela wrote:
> Thomas Huth <thuth@redhat.com> wrote:
>> On 12/04/2023 16.19, Juan Quintela wrote:
>>> Since commit:
>>> commit 1bfc8dde505f1e6a92697c52aa9b09e81b54c78f
>>> Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> Date:   Mon Mar 6 15:26:12 2023 +0000
>>>       tests/migration: Tweek auto converge limits check
>>>       Thomas found an autoconverge test failure where the
>>>       migration completed before the autoconverge had kicked in.
>>>       [...]
>>> migration-test has become very slow.
>>> On my laptop, before that commit migration-test takes 2min10seconds
>>> After that commit, it takes around 11minutes
>>> We can't revert it because it fixes a real problem when the host
>>> machine is overloaded.  See the comment on test_migrate_auto_converge().
>>
>> Thanks, your patches decrease the time to run the migration-test from
>> 16 minutes down to 5 minutes on my system, that's a great improvement,
>> indeed!
>>
>> Tested-by: Thomas Huth <thuth@redhat.com>
> 
> Thanks
> 
>> (though 5 minutes are still quite a lot for qtests ... maybe some
>> other parts could be moved to only run with g_test_slow() ?)
> 
> Hi
> 
> Could you gime the output of:
> 
> time for i in $(./tests/qtest/migration-test -l | grep "^/"); do echo $i; time ./tests/qtest/migration-test -p $i; done
> 
> To see what tests are taking so long on your system?
> 
> On my system (i9900K processor, i.e. not the latest) and auto_converge
> moved to slow the total of the tests take a bit more than 1 minute.

This is with both of your patches applied:

/x86_64/migration/bad_dest
/x86_64/migration/bad_dest: OK

real	0m0,342s
user	0m0,123s
sys	0m0,088s
/x86_64/migration/fd_proto
/x86_64/migration/fd_proto: OK

real	0m1,135s
user	0m0,730s
sys	0m0,514s
/x86_64/migration/validate_uuid
/x86_64/migration/validate_uuid: OK

real	0m0,519s
user	0m0,379s
sys	0m0,230s
/x86_64/migration/validate_uuid_error
/x86_64/migration/validate_uuid_error: OK

real	0m0,275s
user	0m0,145s
sys	0m0,114s
/x86_64/migration/validate_uuid_src_not_set
/x86_64/migration/validate_uuid_src_not_set: OK

real	0m0,514s
user	0m0,377s
sys	0m0,225s
/x86_64/migration/validate_uuid_dst_not_set
/x86_64/migration/validate_uuid_dst_not_set: OK

real	0m0,519s
user	0m0,392s
sys	0m0,220s
/x86_64/migration/dirty_ring
/x86_64/migration/dirty_ring: OK

real	0m1,079s
user	0m0,613s
sys	0m0,532s
/x86_64/migration/vcpu_dirty_limit
/x86_64/migration/vcpu_dirty_limit: OK

real	0m6,308s
user	0m4,025s
sys	0m1,224s
/x86_64/migration/postcopy/plain
/x86_64/migration/postcopy/plain: OK

real	0m35,446s
user	0m47,208s
sys	0m11,828s
/x86_64/migration/postcopy/recovery/plain
/x86_64/migration/postcopy/recovery/plain: OK

real	0m34,707s
user	0m46,357s
sys	0m11,366s
/x86_64/migration/postcopy/recovery/tls/psk
/x86_64/migration/postcopy/recovery/tls/psk: OK

real	0m33,052s
user	0m46,539s
sys	0m11,537s
/x86_64/migration/postcopy/preempt/plain
/x86_64/migration/postcopy/preempt/plain: OK

real	0m35,107s
user	0m46,556s
sys	0m11,755s
/x86_64/migration/postcopy/preempt/recovery/plain
/x86_64/migration/postcopy/preempt/recovery/plain: OK

real	0m35,329s
user	0m46,951s
sys	0m11,529s
/x86_64/migration/postcopy/preempt/recovery/tls/psk
/x86_64/migration/postcopy/preempt/recovery/tls/psk: OK

real	0m36,237s
user	0m51,450s
sys	0m12,419s
/x86_64/migration/postcopy/preempt/tls/psk
/x86_64/migration/postcopy/preempt/tls/psk: OK

real	0m35,033s
user	0m49,244s
sys	0m12,123s
/x86_64/migration/postcopy/tls/psk
/x86_64/migration/postcopy/tls/psk: OK

real	0m36,097s
user	0m50,873s
sys	0m12,569s
/x86_64/migration/precopy/unix/plain
/x86_64/migration/precopy/unix/plain: OK

real	0m1,034s
user	0m0,654s
sys	0m0,463s
/x86_64/migration/precopy/unix/xbzrle
/x86_64/migration/precopy/unix/xbzrle: OK

real	0m1,119s
user	0m0,740s
sys	0m0,499s
/x86_64/migration/precopy/unix/tls/psk
/x86_64/migration/precopy/unix/tls/psk: OK

real	0m3,555s
user	0m5,448s
sys	0m0,655s
/x86_64/migration/precopy/unix/tls/x509/default-host
/x86_64/migration/precopy/unix/tls/x509/default-host: OK

real	0m1,022s
user	0m1,664s
sys	0m0,112s
/x86_64/migration/precopy/unix/tls/x509/override-host
/x86_64/migration/precopy/unix/tls/x509/override-host: OK

real	0m1,841s
user	0m1,921s
sys	0m0,739s
/x86_64/migration/precopy/tcp/plain
/x86_64/migration/precopy/tcp/plain: OK

real	0m1,241s
user	0m0,859s
sys	0m0,584s
/x86_64/migration/precopy/tcp/tls/psk/match
/x86_64/migration/precopy/tcp/tls/psk/match: OK

real	0m2,114s
user	0m2,628s
sys	0m0,613s
/x86_64/migration/precopy/tcp/tls/psk/mismatch
/x86_64/migration/precopy/tcp/tls/psk/mismatch: OK

real	0m0,575s
user	0m0,554s
sys	0m0,116s
/x86_64/migration/precopy/tcp/tls/x509/default-host
/x86_64/migration/precopy/tcp/tls/x509/default-host: OK

real	0m1,538s
user	0m1,460s
sys	0m0,608s
/x86_64/migration/precopy/tcp/tls/x509/override-host
/x86_64/migration/precopy/tcp/tls/x509/override-host: OK

real	0m1,825s
user	0m1,915s
sys	0m0,703s
/x86_64/migration/precopy/tcp/tls/x509/mismatch-host
/x86_64/migration/precopy/tcp/tls/x509/mismatch-host: OK

real	0m0,961s
user	0m1,430s
sys	0m0,111s
/x86_64/migration/precopy/tcp/tls/x509/friendly-client
/x86_64/migration/precopy/tcp/tls/x509/friendly-client: OK

real	0m1,806s
user	0m1,897s
sys	0m0,679s
/x86_64/migration/precopy/tcp/tls/x509/hostile-client
/x86_64/migration/precopy/tcp/tls/x509/hostile-client: OK

real	0m0,645s
user	0m0,614s
sys	0m0,136s
/x86_64/migration/precopy/tcp/tls/x509/allow-anon-client
/x86_64/migration/precopy/tcp/tls/x509/allow-anon-client: OK

real	0m2,204s
user	0m2,695s
sys	0m0,667s
/x86_64/migration/precopy/tcp/tls/x509/reject-anon-client
/x86_64/migration/precopy/tcp/tls/x509/reject-anon-client: OK

real	0m1,530s
user	0m2,360s
sys	0m0,156s
/x86_64/migration/multifd/tcp/plain/none
/x86_64/migration/multifd/tcp/plain/none: OK

real	0m1,055s
user	0m0,647s
sys	0m0,592s
/x86_64/migration/multifd/tcp/plain/zlib
/x86_64/migration/multifd/tcp/plain/zlib: OK

real	0m1,144s
user	0m1,763s
sys	0m0,437s
/x86_64/migration/multifd/tcp/plain/zstd
/x86_64/migration/multifd/tcp/plain/zstd: OK

real	0m1,073s
user	0m0,999s
sys	0m0,537s
/x86_64/migration/multifd/tcp/tls/psk/match
/x86_64/migration/multifd/tcp/tls/psk/match: OK

real	0m1,453s
user	0m2,475s
sys	0m0,704s
/x86_64/migration/multifd/tcp/tls/psk/mismatch
/x86_64/migration/multifd/tcp/tls/psk/mismatch: OK

real	0m0,905s
user	0m1,256s
sys	0m0,106s
/x86_64/migration/multifd/tcp/tls/x509/default-host
/x86_64/migration/multifd/tcp/tls/x509/default-host: OK

real	0m3,761s
user	0m5,874s
sys	0m0,985s
/x86_64/migration/multifd/tcp/tls/x509/override-host
/x86_64/migration/multifd/tcp/tls/x509/override-host: OK

real	0m3,238s
user	0m4,794s
sys	0m0,998s
/x86_64/migration/multifd/tcp/tls/x509/mismatch-host
/x86_64/migration/multifd/tcp/tls/x509/mismatch-host: OK

real	0m0,851s
user	0m1,007s
sys	0m0,120s
/x86_64/migration/multifd/tcp/tls/x509/allow-anon-client
/x86_64/migration/multifd/tcp/tls/x509/allow-anon-client: OK

real	0m2,607s
user	0m3,530s
sys	0m1,013s
/x86_64/migration/multifd/tcp/tls/x509/reject-anon-client
/x86_64/migration/multifd/tcp/tls/x509/reject-anon-client: OK

real	0m1,915s
user	0m3,223s
sys	0m0,180s

real	5m32,733s
user	7m24,380s
sys	1m50,801s

  Thomas


