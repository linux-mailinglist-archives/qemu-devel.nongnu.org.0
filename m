Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099FB6194F4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 11:59:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oquPP-00016v-M6; Fri, 04 Nov 2022 06:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oquPF-00016U-3Z
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:58:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oquPD-0001pR-EJ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667559513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C0lIWCNmy5vSDiIPeGhoQiqa7lgxP6HMXS+VT23hNfU=;
 b=hB3oxw6slrpWaaQQyPKjrSE4Gkuw4qqVPGk92euXIvUtMAVuhTwPyLTnPctd4r53x7DdPB
 9Ep4o5VBXW2YhX9FfbSYD+OZn00mezlZ5pYJyc3qOcCqMnitd6x+poVwomGzp+Nc0sYQig
 jIr/ts0wjuTUlZSDdM+eM/N0zUzTgyY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-1hTk29jXMxK1evdJqwnSjw-1; Fri, 04 Nov 2022 06:58:32 -0400
X-MC-Unique: 1hTk29jXMxK1evdJqwnSjw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so3601924wmb.0
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 03:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C0lIWCNmy5vSDiIPeGhoQiqa7lgxP6HMXS+VT23hNfU=;
 b=N+G6/yOAINX+WNdat6Ca9M+jSmHmSGmWVs/uPE05M07fulVEYYvgpXXYHImtBjcNna
 oPWLeQtarSA9vIloAHtf4h5rxEi4qowTfbrIMkvmBEkNpyU61n+Qmbw54THrePzJOz8X
 uSaCcxP+IlGOKSXzau3NEK5Rfn+dJmp/Dax/zmqYWCm+NV+yu3DVgEoKoLDTQ7+pmRyw
 VK8yAHYd/d4qfYzKw4kQwuNNxXvh6eDOaJKDzKthl6ejFp+nluHIlSuaPtXDSevD8qci
 lA3dSrTzRUhFd5ffUKs+rjCsexD3Y8yYOUOzN+U5xffjWUxjd7URz74SvYDR/P6P9q9e
 ftFw==
X-Gm-Message-State: ACrzQf2cn0kbk3JVyctRTpM8C9Nuqez5KH0P9lIQvX8DkE6ZFUFWpK4q
 bJPsk3Hlg1BMGFeQ0wyo+/RbhQ6xao9rq4/UeOchUSU7c/rC/2Td2QjEYgLazS9P/bSasFVJmjo
 v2tsMWsD+uXlJFyk=
X-Received: by 2002:a05:600c:5563:b0:3cf:857e:18c0 with SMTP id
 ja3-20020a05600c556300b003cf857e18c0mr10138260wmb.24.1667559511243; 
 Fri, 04 Nov 2022 03:58:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5jRDBxkJkXoooUNdwN85olDHQ98hqlXt4ZSLOdpE7yN8Lo8SoND3tqBtKZL1Mhg63L9MNZ7g==
X-Received: by 2002:a05:600c:5563:b0:3cf:857e:18c0 with SMTP id
 ja3-20020a05600c556300b003cf857e18c0mr10138245wmb.24.1667559510986; 
 Fri, 04 Nov 2022 03:58:30 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 k39-20020a05600c1ca700b003b47b913901sm487151wms.1.2022.11.04.03.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 03:58:30 -0700 (PDT)
Message-ID: <680deee3-ccf7-b32c-2dfe-189ab02463d4@redhat.com>
Date: Fri, 4 Nov 2022 11:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20221104092236.184792-1-lvivier@redhat.com>
 <Y2TeNFBUnwW9XZBk@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <Y2TeNFBUnwW9XZBk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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

On 11/4/22 10:41, Daniel P. Berrangé wrote:
...
>> +static void test_stream_unix(void)
>> +{
>> +    QTestState *qts0, *qts1;
>> +    char *expect;
>> +    gchar *path;
>> +    int ret;
>> +
>> +    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
>> +    g_assert_true(ret >= 0);
>> +    close(ret);
> 
> This is creating a zero length plain file, and then paassing
> that as a path for the UNIX socket.
> 
> This is pretty dubious and only works because the code will
> be doing 'unlink' on the path. Just delete this as there's
> no reason to pre-create anything on disk for UNIX sockets.
> 

The idea here is to generate a path for the socket and to be sure this path is actually 
not already in use.

The same for the abstract one, how to be sure we are not running the same test 
concurrently and select a different unix name?

I'm going to address all your comments and send a new version of the patch.

Thanks,
Laurent


