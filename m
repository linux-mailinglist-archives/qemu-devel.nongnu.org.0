Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D918169459E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 13:16:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRXjU-00066m-BE; Mon, 13 Feb 2023 07:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRXjR-000660-Ff
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:14:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRXjO-0001hB-DL
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676290489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2F6FpKR94YCDsnFPyZ/eeXk1LbhpfoIw6pZ5QnGrHY=;
 b=HdWswY88adMEAiWxvIN0X4ez14aV2pVr4WSOt6mxBdney+HO93x8N29RiBHQTx0nE/xvuX
 OwY1nXaF3t8yXSrmtUeMwybTsPaEjwuXBtvcBWRMi0hhFjnKj7JqMftFwSSyw8zcIJj+/S
 ohqZGHcEL6qfbOoHw8Ohif7qq2Bn8nA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-31-vWcLQLHeOqKWl_X_EgIvYQ-1; Mon, 13 Feb 2023 07:14:48 -0500
X-MC-Unique: vWcLQLHeOqKWl_X_EgIvYQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 v8-20020a05622a144800b003ba0dc5d798so7338687qtx.22
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 04:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C2F6FpKR94YCDsnFPyZ/eeXk1LbhpfoIw6pZ5QnGrHY=;
 b=u810FIiDD2fldsgQOe/rYvrIJpjPB7qA27b/xwnhYltmgYUK7spkOqH8oNKi8T/9HY
 P2TD3peFr6NpPTZjDk4LtWVG8MDJAapNUpUHmdfwP88F+qYjPJNV39lYAubqCSXtF9zz
 7Bj+BQWiMK4zHazMYTXzO8t1i2wUeBv/4piDBScTKxwSXbcDKBgKkADM3N0Qk3fMEkGl
 p452ZbOcTRB6AJbyuQGRAhE34wUSSf02kHODJq0T1n5i2jCwzrdYuCwLbM8ryHd8+m+8
 dqNmv+2CSLZ9HPv1DR6Sc+gLE5hbqYAsKiCtufJ0otrEDP3M94GKPTG5YLmbvsY5dD5X
 QTmA==
X-Gm-Message-State: AO0yUKVHW1UeQpsngGy9e+o+H1hR6Qr/cxKxUSzxLzTLr35FNEWO5EzE
 6rvruYOF7CqsQlurmJTYqJL6lerVPPf/0FbRgtmWszisp7ofO0n1hXdpEChmRFNlKMIp240l4DH
 Yx2SqDUbGZccrsaE=
X-Received: by 2002:a05:622a:1653:b0:3b9:c153:f169 with SMTP id
 y19-20020a05622a165300b003b9c153f169mr44811766qtj.0.1676290487707; 
 Mon, 13 Feb 2023 04:14:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8gQJnHrpsOwE+sXXrO7aBs99T2i+jwlBKZ4rdMuLht5/7s1zh+0mYUoqojqFbEthjdT468Ww==
X-Received: by 2002:a05:622a:1653:b0:3b9:c153:f169 with SMTP id
 y19-20020a05622a165300b003b9c153f169mr44811734qtj.0.1676290487474; 
 Mon, 13 Feb 2023 04:14:47 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 v66-20020a37dc45000000b006fba0a389a4sm9701247qki.88.2023.02.13.04.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 04:14:46 -0800 (PST)
Message-ID: <022e89f0-4f45-ac24-6589-22350f8a4ae7@redhat.com>
Date: Mon, 13 Feb 2023 13:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 15/19] hw/s390x/event-facility: Replace
 DO_UPCAST(SCLPEvent) by SCLP_EVENT()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 Gonglei Arei <arei.gonglei@huawei.com>, Cao jin <caoj.fnst@cn.fujitsu.com>,
 Li Qiang <liq3ea@163.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230212225144.58660-1-philmd@linaro.org>
 <20230212225144.58660-16-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230212225144.58660-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/02/2023 23.51, Philippe Mathieu-Daudé wrote:
> Use the SCLP_EVENT() QOM type-checking macro to avoid DO_UPCAST().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/s390x/event-facility.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
> index faa51aa4c7..6891e3cd73 100644
> --- a/hw/s390x/event-facility.c
> +++ b/hw/s390x/event-facility.c
> @@ -64,8 +64,7 @@ static bool event_pending(SCLPEventFacility *ef)
>       SCLPEventClass *event_class;
>   
>       QTAILQ_FOREACH(kid, &ef->sbus.qbus.children, sibling) {
> -        DeviceState *qdev = kid->child;
> -        event = DO_UPCAST(SCLPEvent, qdev, qdev);
> +        event = SCLP_EVENT(kid->child);
>           event_class = SCLP_EVENT_GET_CLASS(event);
>           if (event->event_pending &&
>               event_class->get_send_mask() & ef->receive_mask) {

Reviewed-by: Thomas Huth <thuth@redhat.com>


