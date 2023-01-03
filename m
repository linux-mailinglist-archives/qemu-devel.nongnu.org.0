Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FF165BF64
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 12:53:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCfpj-00046m-7h; Tue, 03 Jan 2023 06:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCfph-00046T-2e
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:51:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCfpf-0003tn-9E
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672746708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3gnye0h4kwhWoVuY/iyY0GdTS3SnqBRMsJ91sFujeoc=;
 b=KvIl5yM1V9fNj9bvaN5O4knAA4L6oQixN6VXqpJX6Pp6C2sN6/Ff1agP0eTrB5hKkdzQh2
 yo/OIQK/6gE/zXU7lIy08LX7tzQsic5EurJP6e+z4uyZT4oa6C8otv9db24g0TY9cXJCUl
 YQwT/cc628MvTo72RhiGi4w0uXzezsY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-aQ64jwqXNp6yIXIjaOZFMg-1; Tue, 03 Jan 2023 06:51:47 -0500
X-MC-Unique: aQ64jwqXNp6yIXIjaOZFMg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r10-20020adfa14a000000b0025ba73dff40so3603873wrr.12
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 03:51:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3gnye0h4kwhWoVuY/iyY0GdTS3SnqBRMsJ91sFujeoc=;
 b=7AXorMbt5bxY+5VpPZ/1DxWHKYdcA3QOVXpT3YZlB5CHCDqCAcS+axFKjG369zSUsr
 HKWPbxIhGzC9MgtMRknoJ2WKvpczhM2PWZ9KdJW6bpCIG4KR2nhaEqLxueMY3UbSjE9q
 T1J8LjMZgxEnkWIXdYRSNinHszUiIRTnN0n5NzgP6FM7gkefadmzjmueeGQ2MKsqO6+g
 7yWMIM94kknCokvm9m9NAkTt0s/WPvyTVyjqrYBYHfAbCl01weZox6LHtSuFmflZf/wp
 mmMA+XXKwepjDzOad3KTj5CtBU8JYWXXHCukeYNyIFpDeLbkacihn9XkHE+8xiDy9YWT
 b9xQ==
X-Gm-Message-State: AFqh2kqBrae5ZMGsb28gxlr4T9aQxHhDi+QzBrLlLs3YRG6bkMO6Yz+J
 hWUrXhfpkGscRZFXJ8DkFC7SPKI/qp/VZbQDe+xT3LLE4HLxS3bwJ9c7p6iamM76QC70iE1+VGf
 +jIVPFEcwV9X6epQ=
X-Received: by 2002:a05:600c:3d12:b0:3d3:5027:89a4 with SMTP id
 bh18-20020a05600c3d1200b003d3502789a4mr34868714wmb.7.1672746706562; 
 Tue, 03 Jan 2023 03:51:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9WsU38YnBgwxT5RMzfY2fEqOz2/NgPuwbgqX4eSwOJjhtRkIPmWJhFzvTmUx+iB0gckEXyg==
X-Received: by 2002:a05:600c:3d12:b0:3d3:5027:89a4 with SMTP id
 bh18-20020a05600c3d1200b003d3502789a4mr34868696wmb.7.1672746706342; 
 Tue, 03 Jan 2023 03:51:46 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 j1-20020adfff81000000b0024cb961b6aesm30341734wrr.104.2023.01.03.03.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 03:51:45 -0800 (PST)
Message-ID: <fb755f18-887c-bbb3-8402-cc88eb7cce38@redhat.com>
Date: Tue, 3 Jan 2023 12:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 2/2] s390x/pv: Add support for asynchronous teardown
 for reboot
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-devel@nongnu.org, david@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, pasic@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, seiden@linux.ibm.com
References: <20221222150421.35839-1-imbrenda@linux.ibm.com>
 <20221222150421.35839-3-imbrenda@linux.ibm.com>
 <e28ce124-6ae8-2ae3-5d66-f7cf1a02a1cd@redhat.com>
 <20230103124814.377cd0b2@p-imbrenda>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230103124814.377cd0b2@p-imbrenda>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/01/2023 12.48, Claudio Imbrenda wrote:
> On Tue, 3 Jan 2023 12:27:32 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 22/12/2022 16.04, Claudio Imbrenda wrote:
>>> This patch adds support for the asynchronous teardown for reboot for
>>> protected VMs.
>> [...]
>>> +bool s390_pv_vm_try_disable_async(void)
>>> +{
>>> +    char tname[VCPU_THREAD_NAME_SIZE];
>>> +    QemuThread *t;
>>> +
>>> +    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
>>> +        return false;
>>> +    }
>>> +    if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {
>>> +        return false;
>>> +    }
>>> +
>>> +    t = g_malloc0(sizeof(QemuThread));
>>> +    snprintf(tname, VCPU_THREAD_NAME_SIZE, "async_unpr/KVM");
>>> +
>>> +    qemu_thread_create(t, tname, s390_pv_do_unprot_async_fn, NULL,
>>> +                       QEMU_THREAD_DETACHED);
>>
>> I think you could get along without the tname[] array here by simply passing
>> the string directly to qemu_thread_create() ?
> 
> ahh, you're right
> 
> maybe I should also pick a better name? in retrospect it looks quite
> cryptic

Yes, please!

  Thomas



