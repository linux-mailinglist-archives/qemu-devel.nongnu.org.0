Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9314F9901
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 17:06:42 +0200 (CEST)
Received: from localhost ([::1]:56042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncqC9-0004qY-O5
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 11:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncpvw-0001wx-OP
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncpvt-0007UU-8k
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649429391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4DuRc27UVirpINa/bcVi+uF19XsSWK0BXVZt72EJuqU=;
 b=A7RPOT8tBVGnlM54ZEiNyWK6uMghe6ToKNEifz4VYjsFoeQ7NkU/I9shpPAjfEYLriqZJF
 GmBzfhQo5u8DJ4Lsj/yLayq9deJSavINwpVELB4QFrh2NORmBixiEuu0XkJewQWrx5n4Dg
 gQM9arP9c0+Qc/2wR+zJFoN6C/DRN/8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-SX35MsA2NTOuknzmR8UCog-1; Fri, 08 Apr 2022 10:49:50 -0400
X-MC-Unique: SX35MsA2NTOuknzmR8UCog-1
Received: by mail-ed1-f69.google.com with SMTP id
 i4-20020aa7c9c4000000b00419c542270dso4764173edt.8
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4DuRc27UVirpINa/bcVi+uF19XsSWK0BXVZt72EJuqU=;
 b=PajJaSgQu3V+zf7LcpacRSxo4+jjdk/4VMVi5tFPXSkWJE5PkXe5WCgyLAsiROLidC
 XmN8syl/g6R6yvJJO1X4LqAcX8IQOl+tlAU/FnTq+VsrJ4SlujFj0Ou97EQfNe1TQTm2
 HFhM27D22O+i4sIC1xLO0xW3qoGFkpRMauRaHJfFeEtyVUMAk2Z1TYhfH09qJpumung7
 DMZll/X/U1XEhjw1QfvQVaV7N6ydwupJTxaefu/UGqTUWD8QYxCKXgpNdl1/Uz/fJorx
 XzJlQdDTvO+DZPum0v8QOCmwnIRJfI4XfDNzaDccIfncm0LHrUEfDUMSi4zjzaKzDIod
 W6lg==
X-Gm-Message-State: AOAM5320P31DZwFhLKHH14W5IbvZUqTaeuLi1wiM3MQrhzPE/EeL1qNo
 hPTDNEgqMn2mqqakrd9WBae09Y0Sua1mFoIhaAIHD3KpEsojaivkveuKuKex4UcBVHFura+8KPX
 DC7RHu/SPpJwU79A=
X-Received: by 2002:a17:907:8a1e:b0:6e8:4cdf:ebab with SMTP id
 sc30-20020a1709078a1e00b006e84cdfebabmr3793757ejc.304.1649429389494; 
 Fri, 08 Apr 2022 07:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM2Ikve16kPwtKA2ncvnntvueXXV1zK6KRniiuWMWFR/6rhXIfya48CToCf3lCx6WBRGlsQQ==
X-Received: by 2002:a17:907:8a1e:b0:6e8:4cdf:ebab with SMTP id
 sc30-20020a1709078a1e00b006e84cdfebabmr3793723ejc.304.1649429389222; 
 Fri, 08 Apr 2022 07:49:49 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 gb3-20020a170907960300b006dfafbb4ba4sm8858629ejc.83.2022.04.08.07.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 07:49:48 -0700 (PDT)
Message-ID: <49d41805-b88a-354d-d20c-76839ab671b9@redhat.com>
Date: Fri, 8 Apr 2022 16:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 3/7] iotests: add copy-before-write: on-cbw-error tests
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220407132726.85114-1-vsementsov@openvz.org>
 <20220407132726.85114-4-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220407132726.85114-4-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, vsementsov@openvz.org, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.04.22 15:27, Vladimir Sementsov-Ogievskiy wrote:
> Add tests for new option of copy-before-write filter: on-cbw-error.
>
> Note that we use QEMUMachine instead of VM class, because in further
> commit we'll want to use throttling which doesn't work with -accel
> qtest used by VM.
>
> We also touch pylintrc to not break iotest 297.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   tests/qemu-iotests/pylintrc                   |   5 +
>   tests/qemu-iotests/tests/copy-before-write    | 132 ++++++++++++++++++
>   .../qemu-iotests/tests/copy-before-write.out  |   5 +
>   3 files changed, 142 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/copy-before-write
>   create mode 100644 tests/qemu-iotests/tests/copy-before-write.out

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


