Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F50619175
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 07:56:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqqbL-0005qT-21; Fri, 04 Nov 2022 02:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oqqb2-0005q9-U6
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 02:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oqqb1-00073N-0l
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 02:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667544868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PLwjNrS10hAl93Noag9w4eSRGv8NX8MdSS5oxSA4BI=;
 b=UlLDWPOeCxXi9Tf6hUkbBOgZhsybeho9/vWRxpuLX/5EiJG0LzfJxXOAHD1WHYPmWIpqXY
 N7jM62u0c9hYIVIOHpb6MA5GrUImKUTf/PgMN7qOVyHx29JZbMZ651Kx1CZU5UComKsl9/
 KI+ecOoCoX/34LGZlg2lewf7GulboJs=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-nFaZwHGENX68NNmxoMyGSw-1; Fri, 04 Nov 2022 02:54:24 -0400
X-MC-Unique: nFaZwHGENX68NNmxoMyGSw-1
Received: by mail-pf1-f200.google.com with SMTP id
 f189-20020a6238c6000000b0056e3400fdc0so1973982pfa.10
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 23:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1PLwjNrS10hAl93Noag9w4eSRGv8NX8MdSS5oxSA4BI=;
 b=VSd6taQrLMq12h/lWUp9ZQv0V/gAvmdA9l8P2QHMy0wA4H6uocZjt8gy8kBrHyKUlj
 I8Mr9JWkyStewHtGySJkZrWipSYUsYTFJV/pU5/HhIrhYmJ4SFYy6rHvTEWghmKUCWfc
 rxRvIkf+7M2l79PwZwkNj05GWaiQ+LTnv4rl2DTLxigllAygDf1lFi0dPX0pMuIpSO79
 rwAxAKz4mT4SPsDeG6b+31IxNb0sgs/mGDkcflaW20eWppfgKNRamABxQV+5o4glv36E
 rwljEvqAd2AiBIr+2AAY3Gfryy0LK1GMMhgGurhHe8dUW2/2yxyKkxmtg1GasuliPNdj
 5vjw==
X-Gm-Message-State: ACrzQf1mL1Fd0nsU7vrFFIDtucsm2EMAl0/DwP3SEdASALGhqrW3ylT+
 t0xpIA2dwDUpgX7d5qajpw71oqlIZKQQQWuUcX4LRzVS1SOl78RKamYGZMdTfxjC8dMGYURSHVT
 trArkN66boII0Qm0=
X-Received: by 2002:a17:902:eb8a:b0:186:949e:8eb6 with SMTP id
 q10-20020a170902eb8a00b00186949e8eb6mr34444905plg.63.1667544863280; 
 Thu, 03 Nov 2022 23:54:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5oynVY5eRCch1+7iu0gHDiqvgDtt/2V13XPjw3vIEzqAfpQKMY9zH+TdeGGfW+fRvotJU5mg==
X-Received: by 2002:a17:902:eb8a:b0:186:949e:8eb6 with SMTP id
 q10-20020a170902eb8a00b00186949e8eb6mr34444879plg.63.1667544862994; 
 Thu, 03 Nov 2022 23:54:22 -0700 (PDT)
Received: from [10.72.13.71] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 p188-20020a62d0c5000000b005668b26ade0sm1863136pfg.136.2022.11.03.23.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 23:54:22 -0700 (PDT)
Message-ID: <f37dc07b-5855-7823-2028-c50fa4b10eb1@redhat.com>
Date: Fri, 4 Nov 2022 14:54:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v14 16/17] tests/qtest: netdev: test stream and dgram
 backends
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-17-lvivier@redhat.com>
 <700ef645-6cb6-66e6-00a9-3db187be0c43@redhat.com>
 <0fd82709-7612-25e0-66c0-d9494931d8c4@redhat.com>
Content-Language: en-US
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <0fd82709-7612-25e0-66c0-d9494931d8c4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/11/3 17:33, Laurent Vivier 写道:
> On 10/28/22 07:04, Jason Wang wrote:
>>
>> 在 2022/10/21 17:09, Laurent Vivier 写道:
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>
>>
>> I got this:
>>
>> 63/63 ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: 
>> assertion failed (resp == expect): ("st0: 
>> index=0,type=stream,connection error\r\n" == "st0: 
>> index=0,type=stream,tcp:::1:40389\r\n") ERROR
>> 63/63 qemu:qtest+qtest-x86_64 / 
>> qtest-x86_64/netdev-socket                  ERROR 5.29s   killed by 
>> signal 6 SIGABRT
>>  >>> QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 
>> MALLOC_PERTURB_=96 
>> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
>> G_TEST_DBUS_DAEMON=/home/devel/git/qemu/tests/dbus-vmstate-daemon.sh 
>> /home/devel/git/qemu/build/tests/qtest/netdev-socket --tap -k
>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
>> ✀ 
>> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>> stderr:
>> **
>> ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: 
>> assertion failed (resp == expect): ("st0: 
>> index=0,type=stream,connection error\r\n" == "st0: 
>> index=0,type=stream,tcp:::1:40389\r\n")
>>
>> (test program exited with status code -6)
>
> I'm not able to reproduce the problem.
>
> Is this 100% reproducible?


Yes.


> Is IPv6 enabled on your test machine?


Yes.

Try to investigate it more, it looks like the reason is hostname. I'm 
testing in ubunut which has the following things in /etc/hosts

127.0.0.1    localhost
127.0.1.1    jason-ThinkPad-X1-Carbon-6th
192.168.100.2   guest

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

So localhost is mapped to ipv4 and there's no ipv6 mappings here. Using 
"::1" for the address seems to fix the issue.

Thanks

>
> Thanks,
> Laurent
>


