Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372A46CF41
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 09:42:26 +0100 (CET)
Received: from localhost ([::1]:52422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1musWu-0006Zg-KN
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 03:42:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1musUI-0004gt-2k
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:39:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1musUE-00069K-PV
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638952777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNFybkM1+WA0a7QuJ022GEcFIC/tKC0lHCPr4feu6/s=;
 b=fGA7jpkMmH2ngNf8n8byLwxwpyDipKO5GAnNltCwWre5BBav8h3qFCRXcpE6nHhsqysHou
 1P/LAE5mISQuc2jMVkBGLCgARYVG1PEUKenv+EiidCSS3ehx4pnkNWvhZdrHXZNIal9Zht
 RsBaeihNCwzoZBct1mV6psNI6ts+xl4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-_nMitNCuNVKxbeOjqpqqjg-1; Wed, 08 Dec 2021 03:39:36 -0500
X-MC-Unique: _nMitNCuNVKxbeOjqpqqjg-1
Received: by mail-wr1-f70.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso221879wrw.7
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 00:39:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HNFybkM1+WA0a7QuJ022GEcFIC/tKC0lHCPr4feu6/s=;
 b=fNSxS0P0SDH3wptx1IxvNLypZcnR7S8DZk/dw/BCzfqGw5zsxaijVxxEoc5bFCb4Hf
 S2Lorgf74WansA8E+s8iPA4O93NaZlwurBFhy3SYrgZRCN0GXHFOEWyLb3bFRc7H6FQ/
 sY4pXcIhz3p6bo0jwnqdjeJva09XPlKgkamZJ/3MslqBWfZV4QyFgaZNaPjcWD0vVnjz
 sQLqzI3x+tjuWzEerh4+eiNQvyi7kHyiRDV+EoCA4wAb2Jq6HKplwDtoHvk9rPuCNmFC
 1PDLouLnlZ5nmUASYvHnqfgUNVaEk0+aCRVzYzhO1CioQ2tbr9BheFhHXTErI4DpOUtO
 WQ8g==
X-Gm-Message-State: AOAM532L3Al7EF64+FYWsj3tbspDh9ex2mdH38bWmhnX9WOA+tu0v8Dh
 KgAKOBHj92SQlP2BjuUnbMUh/jfEq/EzLCEh46LJZATqNGNiCPKD24jSboyefyq7zRmY2AfLim3
 z5wlilqyweuM4dVQ=
X-Received: by 2002:a7b:cf35:: with SMTP id m21mr13866249wmg.140.1638952775523; 
 Wed, 08 Dec 2021 00:39:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztmHKhHfZi/vOC7imBJrNYSm3Qxw0Hwo2DfYxKtoD/rbeqnlMwOLyGnyGrjnCGk3zSiButjA==
X-Received: by 2002:a7b:cf35:: with SMTP id m21mr13866229wmg.140.1638952775354; 
 Wed, 08 Dec 2021 00:39:35 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id l22sm1890146wmp.34.2021.12.08.00.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 00:39:34 -0800 (PST)
Message-ID: <a54b31e2-0327-6134-517c-71147f3aa6fa@redhat.com>
Date: Wed, 8 Dec 2021 09:39:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 2/4] tests/qtest: add some tests for virtio-net failover
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211207172342.4058491-1-lvivier@redhat.com>
 <20211207172342.4058491-3-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211207172342.4058491-3-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2021 18.23, Laurent Vivier wrote:
> Add test cases to test several error cases that must be
> generated by invalid failover configuration.
> 
> Add a combination of coldplug and hotplug test cases to be
> sure the primary is correctly managed according the
> presence or not of the STANDBY feature.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
[...]
> diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
> new file mode 100644
> index 000000000000..7444d30d2900
> --- /dev/null
> +++ b/tests/qtest/virtio-net-failover.c
[...]
> +static char *get_mac(QTestState *qts, const char *name)
> +{
> +    QDict *resp;
> +    char *mac;
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'qom-get', "
> +                     "'arguments': { "
> +                     "'path': %s, "
> +                     "'property': 'mac' } }", name);
> +
> +    g_assert(qdict_haskey(resp, "return"));
> +
> +    mac = g_strdup( qdict_get_str(resp, "return"));

FYI, check_patch.pl complains about the space after the "(" here.

I'll fix it up locally, no need to resend just because of this.

> +    qobject_unref(resp);
> +
> +    return mac;
> +}

  Thomas


