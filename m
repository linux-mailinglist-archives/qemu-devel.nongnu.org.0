Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91805FB2DF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:07:18 +0200 (CEST)
Received: from localhost ([::1]:53742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEyb-0001ND-Po
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDQg-0008RF-I7
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:28:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDQd-0002iU-L9
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665487685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rnw+pxA7kEWD6yPnfNcCnIZWUBAUEs2soUA/TwYXqYY=;
 b=S/0u9fwlOFJQ3HBaHK2WGeUK+5L6fqbH6YZLMfVee75aRM7jVB2jmhKY4uigU7dzKFGf8c
 FreZUy9sylYagGxQFWsHcpFgezdms6j4U5IsHrRE8BJMpU2Fkds7KSgy+sgqMONqngYena
 iy3udtUS6F4UcqkpgBjjk84UdE73MSk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-kVnr90_XMR6cv_PQvU7NMg-1; Tue, 11 Oct 2022 07:27:56 -0400
X-MC-Unique: kVnr90_XMR6cv_PQvU7NMg-1
Received: by mail-wr1-f70.google.com with SMTP id
 m20-20020adfa3d4000000b0022e2fa93dd1so3709879wrb.2
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rnw+pxA7kEWD6yPnfNcCnIZWUBAUEs2soUA/TwYXqYY=;
 b=VFcDEayvNCjaYai2iA0qVnLGIxDxDApe7iIxpvKeWTdmrPeHNRi6i//WbyVHgH9yPm
 +GabOKUVQSYPCJE8fi8jHRdexc6CeeobnAPMvYL95UYq+c62LUr+L5Cmobb0hwhBHtrX
 CgijrbRwud54oZU6qvGy33zww8zgDFWJ5tmy5DRhNA5JaZPn5NyOj/WCeKN0aQH9WTWx
 khO+z4nAnTQsKfz9IVxbz3QSfjkk/d2Q7GnPdV7npCE/Vve6v7o4EzXek4AoULqwfAB+
 REs6Dh0WzlGDWeykA8nQ6wGrY5fPF9jlNVvPZVX2xbMUmlUQgJLozdekjANb4+nWo3RK
 83+w==
X-Gm-Message-State: ACrzQf1W/WaRD2JZEJq0+KDEBS7P6pNRYDM9lh6R07XaiduqNpXihb5c
 Nu17aXE2tTV0tFbT5jbqXOZGIU85Ic2Dxp+4vqDFq3XqLQkFKtHAvqWO/kzjx7RIcY8eEjhDFrn
 sSh/0H+E242gkaOg=
X-Received: by 2002:a05:6000:1a8e:b0:230:848c:416d with SMTP id
 f14-20020a0560001a8e00b00230848c416dmr6428872wry.264.1665487675688; 
 Tue, 11 Oct 2022 04:27:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5MSlLPJHY9RIhOI2QzUpLXHq+56fFxWkEp2svNkqsWJR8yYEhw8YkfXquJ7muHDjv8c4/F+w==
X-Received: by 2002:a05:6000:1a8e:b0:230:848c:416d with SMTP id
 f14-20020a0560001a8e00b00230848c416dmr6428857wry.264.1665487675516; 
 Tue, 11 Oct 2022 04:27:55 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 ba1-20020a0560001c0100b002252884cc91sm11202448wrb.43.2022.10.11.04.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 04:27:55 -0700 (PDT)
Message-ID: <2280c594-2ae1-bc42-d9d4-7f3598725564@redhat.com>
Date: Tue, 11 Oct 2022 13:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 7/9] tests/x86: replace snprint() by g_strdup_printf()
 in drive_del-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
 <20220929223547.1429580-8-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220929223547.1429580-8-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/2022 00.35, Michael Labiuk via wrote:
> Using g_autofree char* and  g_strdup_printf(...) instead of ugly
> snprintf on stack array.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/drive_del-test.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
> index 44b9578801..106c613f4f 100644
> --- a/tests/qtest/drive_del-test.c
> +++ b/tests/qtest/drive_del-test.c
> @@ -123,12 +123,10 @@ static const char *qvirtio_get_dev_type(void)
>   
>   static void device_add(QTestState *qts)
>   {
> -    QDict *response;
> -    char driver[32];
> -    snprintf(driver, sizeof(driver), "virtio-blk-%s",
> -             qvirtio_get_dev_type());
> -
> -    response = qtest_qmp(qts, "{'execute': 'device_add',"
> +    g_autofree char *driver = g_strdup_printf("virtio-blk-%s",
> +                                              qvirtio_get_dev_type());
> +    QDict *response =
> +               qtest_qmp(qts, "{'execute': 'device_add',"
>                                 " 'arguments': {"
>                                 "   'driver': %s,"
>                                 "   'drive': 'drive0',"

Reviewed-by: Thomas Huth <thuth@redhat.com>


