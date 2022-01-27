Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984449DDCF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:22:48 +0100 (CET)
Received: from localhost ([::1]:59324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0zP-0001mD-Dv
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:22:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nD0vS-0007Lj-JP
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:18:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nD0vC-0005Yj-2Z
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643275105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGY2FtQjF+FNYl+VpEa1qVfVjO2ol8ICrAUSIDWBt1U=;
 b=KdwulOvsjycdpDfZxCPYJ27N6CTPPXv9maA/pjgQR8DYbK0auqpibsi0AF+k41eiFZDFw+
 GD67FKMINjkZmzlxoNd4gkZBKJzFW7LydlhpTb0SxT5olEqtKisZzBkDVsXTVO39cn21Q1
 rSz4CmljYrsRsxoC2pHHMy4mdt+ITBk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-AudcoWfMNamZqhRZ5hGQLg-1; Thu, 27 Jan 2022 04:18:24 -0500
X-MC-Unique: AudcoWfMNamZqhRZ5hGQLg-1
Received: by mail-qv1-f72.google.com with SMTP id
 hu4-20020a056214234400b0041ad4e40960so2558707qvb.13
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 01:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VGY2FtQjF+FNYl+VpEa1qVfVjO2ol8ICrAUSIDWBt1U=;
 b=Ikd08Rx8MdUHh+G2OSNMwHJ1K18Ezj8u4BZgJ6japsFHWUR4z5dp2QeusfIApMcQy/
 JMgldgzjpRLAIQz4MVNk6B8y12+jdHuYfLuT0NvSjKJl/YVlg4celtBL9F9ps5v34lhN
 xmMCFnT78AKxlGHDVtqVCvpB7pTV7hXzGlh26fw+3oSMjJNw6jjC2JblwvUqHpPomCuU
 1upntKWH58SdzQ+uPbCV9UOYYHpmXqwLjqYisdzBki+op8jrcwsD3TEDYzOOAvtzZGU+
 eWHQbXFMzYCHRsb7xKC825M09vfii20EVxNOTI1MoJLIymknKx7X8vrW98cad6y9GDEw
 4ayw==
X-Gm-Message-State: AOAM5333jmO0MyuTOlFi0vbJEHfdh60zPLj6cJsjDoooGPbDTmfmMaV0
 zrwk8zhq6WTz3ldNf0AYazSnnBFMWhf1o2Z72nKD2j979ZDo9L1yF8jOq2gZ9ZmUfkA6agu9yLO
 1S7xS6lhkLi8LU6I=
X-Received: by 2002:a05:620a:22c4:: with SMTP id
 o4mr1904848qki.534.1643275102828; 
 Thu, 27 Jan 2022 01:18:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpxCKzwJ43SD8X8+3cWAw1xbq026CQZzHpro9e/3NwieuagECwgwliiKOcsk81Who8gBiPqQ==
X-Received: by 2002:a05:620a:22c4:: with SMTP id
 o4mr1904832qki.534.1643275102543; 
 Thu, 27 Jan 2022 01:18:22 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id m4sm1039533qka.111.2022.01.27.01.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 01:18:22 -0800 (PST)
Message-ID: <8101768a-6f0d-ccb2-7c3d-810118dc7875@redhat.com>
Date: Thu, 27 Jan 2022 10:18:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 20/33] block: rename bdrv_invalidate_cache_all,
 blk_invalidate_cache and test_sync_op_invalidate_cache
To: quintela@redhat.com
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-21-eesposit@redhat.com>
 <87r18x5s70.fsf@secure.mitica>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <87r18x5s70.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 24/01/2022 11:44, Juan Quintela wrote:
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 0652165610..1f06fd2d18 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -499,7 +499,7 @@ static void process_incoming_migration_bh(void *opaque)
>>              global_state_get_runstate() == RUN_STATE_RUNNING))) {
>>          /* Make sure all file formats flush their mutable metadata.
>>           * If we get an error here, just don't restart the VM yet. */
>> -        bdrv_invalidate_cache_all(&local_err);
>> +        bdrv_activate_all(&local_err);
> I guess that we can change the comment here, it just looks weird the
> comment saying flush() and the function nawed _activate()
> 

Do you think it's enough to replace "flush" with "activate"? I am not
sure whether "activate their mutable metadata" is meaningful.

Thank you,
Emanuele


