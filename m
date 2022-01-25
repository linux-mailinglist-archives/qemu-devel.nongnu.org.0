Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFC449B0B8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:49:18 +0100 (CET)
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIRx-0003RY-3S
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:49:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCILh-000843-H2
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:42:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCILa-0006ey-2f
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643103760;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zeAtsBnu/IOsJWsxQrxQQtnnQXW9k7w0lTnaVzj8Mys=;
 b=XfQE+aPDfT8lId7TH5qi6TBJr79POt8vvuNCrpHifwJLT1tPFJMO4ccfadkHWH8TOv8vsI
 DScLcnFqVnsAEIC2OSpAc+BrWUNIXtK1ljgAn+A6EwFVEc2Rck2njqWB+6OHDIuBWW76HJ
 YIWDmdeky5tgPZn3k0maN2/WTI3oWQM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-nm1wLnhMNeCaqiCM1U2ycg-1; Tue, 25 Jan 2022 04:42:38 -0500
X-MC-Unique: nm1wLnhMNeCaqiCM1U2ycg-1
Received: by mail-wr1-f71.google.com with SMTP id
 q4-20020adfbb84000000b001dd3cfddb2dso305601wrg.11
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 01:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=zeAtsBnu/IOsJWsxQrxQQtnnQXW9k7w0lTnaVzj8Mys=;
 b=4IwMU7f1Sd8sL+c34fSeFtlW/InagSkjvXIahJggca2vzDVdtriqBXCNijHW9c8GPX
 nSjdYTdyfxVHaG5h/9VuRJPo+Iyr30y/tpG/bstWIhAR2t6GDbIz1OyLvJK4ha1yvDSe
 FTuol7Kk59K0o2WfxMa850rINWBKV7GeCxYjA/twohP1VQCh45zFoUrByPMIiDqLaCty
 az9/GRWI/SqTtVTcyf/l61UHwZNyYqQgxUCs1SCBI57X1qsIfU1olqIoxzYaEe8S5c0U
 F7uDdKFcZlGdIWOTRdQxcsEpNgW2Cfv+vNAl6ktypaHhlclpZKVyvhEPpbFsMhwBhHlr
 Y7xQ==
X-Gm-Message-State: AOAM532FMr2f0WVhp53sqUekYAk7ddNwrH+CMkGiiOyYrowKBl1wz2tO
 9InAxE7sF4hz9jHInCmFip9JvSHH2JpYpE5AhJdNxIPERMPCSQvJufUUJa6e2g15cY6x5ye8cU0
 AwIWOk6FrStfCkX0=
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr2130664wmm.16.1643103757631; 
 Tue, 25 Jan 2022 01:42:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3PCg7AgsQSscQkFfPybAHkUSpblZKTPzWTOElG1V3kk6DsZXeTDVytbm7z/dqQt8ZEmL1wA==
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr2130643wmm.16.1643103757445; 
 Tue, 25 Jan 2022 01:42:37 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id u15sm4649810wrs.17.2022.01.25.01.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 01:42:37 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 21/23] multifd: Zero pages transmission
In-Reply-To: <YecbN5MbUvL3oVKm@work-vm> (David Alan Gilbert's message of "Tue, 
 18 Jan 2022 19:55:35 +0000")
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-22-quintela@redhat.com>
 <YecbN5MbUvL3oVKm@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 10:42:36 +0100
Message-ID: <87h79srw1f.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> This implements the zero page dection and handling.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> 
>> ---
>> 
>> Add comment for offset (dave)
>>              }
>>          }
>>  
>> +        for (int i = 0; i < p->zero_num; i++) {
>> +            memset(p->host + p->zero[i], 0, qemu_target_page_size());
>> +        }
>> +
>
> On the existing code, it tries to avoid doing the memset if the target
> page size matches; that avoids allocating the zero pages on the
> destination host; should we try and do the same here?
>
> Dave

Hi Dave

That only happens on postcopy.
With precopy we have to do the memset, because we can have:

write non zero to page 50
migrate page 50
write zeros to page 50
Another migration pass
If we don't write here, we have garbage on the page.

Or I am missing something?

Later, Juan.


