Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901B6617A0D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 10:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqWct-0002ke-5S; Thu, 03 Nov 2022 05:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oqWcJ-0002ef-0P
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 05:34:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oqWbv-0003pa-4X
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 05:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667468046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZR2OFVocz6kJ+L6ckJorPi7uGwBY94ZglCfP5VOmhw=;
 b=hPrxQVEjQcFcsNEBFwrthu/x9kISKIfUa9RLNFMU7m923mjvEE7nf/g76IgOP4RCRDSxdn
 FCsthxIld0cXg8Vxnp8XaFH6XHC3diyKc/QNncrYZEp+xPJn2t9Mmf7WPInsef/mg9WQbf
 2VTVOD1sWYhz/yJJyDrai+Z60kH32W4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-kLzQOLD6OamdUw8poqKSnQ-1; Thu, 03 Nov 2022 05:34:05 -0400
X-MC-Unique: kLzQOLD6OamdUw8poqKSnQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 c6-20020ad44306000000b004bb8352cb4cso949799qvs.14
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 02:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gZR2OFVocz6kJ+L6ckJorPi7uGwBY94ZglCfP5VOmhw=;
 b=LKY8Nj8yRPOgCc6nl+ls2o3eryNj9z52dEWC2EuQcEHUi6qPPvaUAW6DdgY9M0esr+
 oe2Mxmq5TGfx0iXKosjC4Yj8AfHCKRfgnph3npqfD+FCp8s+9rLhELSjQM7HQSvfOJ6X
 BhR9XO+E31u2ShqnFLRbKyP4kTKsQxEkj2G1nTXDKKSO92ilxQnCHxLd0GBoOukM41bL
 XZpPqv7SfDsYd/Gm9GjqmZGy7iDrRw2zVZIhifEQi5DcuaScDEsxT1K8HhCVRh/s9rS8
 Xa6JMJsFT+9HTqArenG6xgXN+jDHbDEZmM+uW/CbZMEf6hDSyQm3eRrVvqFjlWxM5SUX
 cCvw==
X-Gm-Message-State: ACrzQf0km/z3jPegmgW3TxR9tuDdfXtG2ily7/aKVpuMHPD2yaY+IYM2
 W/qXBWFAAgJnYKDjVQVvTV5qToDNlmayhTifWkiBE8pTkKreouwrYaDJjO9OZZbxMyOdt3IGrsv
 lcucidy8YXS7Ztx4=
X-Received: by 2002:a05:620a:1476:b0:6fa:4c67:83ec with SMTP id
 j22-20020a05620a147600b006fa4c6783ecmr9443018qkl.23.1667468044923; 
 Thu, 03 Nov 2022 02:34:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM61B3CKx0tKxBrzDYllgkLf+57PFgkDaree4gsL0Eyl4wlfGwGUj1xL01wTG6Emx1VJNx7whQ==
X-Received: by 2002:a05:620a:1476:b0:6fa:4c67:83ec with SMTP id
 j22-20020a05620a147600b006fa4c6783ecmr9443002qkl.23.1667468044643; 
 Thu, 03 Nov 2022 02:34:04 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 m4-20020ac866c4000000b0039cc7ebf46bsm181307qtp.93.2022.11.03.02.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 02:34:04 -0700 (PDT)
Message-ID: <0fd82709-7612-25e0-66c0-d9494931d8c4@redhat.com>
Date: Thu, 3 Nov 2022 10:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 16/17] tests/qtest: netdev: test stream and dgram
 backends
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
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
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <700ef645-6cb6-66e6-00a9-3db187be0c43@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 10/28/22 07:04, Jason Wang wrote:
> 
> 在 2022/10/21 17:09, Laurent Vivier 写道:
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
> 
> 
> I got this:
> 
> 63/63 ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: assertion failed 
> (resp == expect): ("st0: index=0,type=stream,connection error\r\n" == "st0: 
> index=0,type=stream,tcp:::1:40389\r\n") ERROR
> 63/63 qemu:qtest+qtest-x86_64 / qtest-x86_64/netdev-socket                  ERROR 5.29s   
> killed by signal 6 SIGABRT
>  >>> QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 MALLOC_PERTURB_=96 
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
> G_TEST_DBUS_DAEMON=/home/devel/git/qemu/tests/dbus-vmstate-daemon.sh 
> /home/devel/git/qemu/build/tests/qtest/netdev-socket --tap -k
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀ 
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> stderr:
> **
> ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: assertion failed (resp == 
> expect): ("st0: index=0,type=stream,connection error\r\n" == "st0: 
> index=0,type=stream,tcp:::1:40389\r\n")
> 
> (test program exited with status code -6)

I'm not able to reproduce the problem.

Is this 100% reproducible?
Is IPv6 enabled on your test machine?

Thanks,
Laurent


