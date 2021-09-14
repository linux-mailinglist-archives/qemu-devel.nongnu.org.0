Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F6840B5D5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:23:13 +0200 (CEST)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQC9I-0003zJ-OB
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQC6T-0000Mi-B3
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:20:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQC6R-0004MP-M1
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631640014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2f/Fqt8HJW/atFOMp22PMAtjCEBVV+v6wZhUEJwc+M=;
 b=TjY3flDEYZZgsfeXhgu+hDGJhoVW56Yw5fWhsQOO/s6vF9k2rhy+k9LD5PyudldbTuglNL
 gnN8/pxRdVbrjsyeHPVTlomZFsb92kXDhXd8+pbz0RJhy2GX9+vPUrq8cWHJRK7i7ILrjG
 wDsZTfpVDkbY+uMtMWcbYSJpyvImAEM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-ajLYa_a9P0-2OImcpS90mA-1; Tue, 14 Sep 2021 13:20:13 -0400
X-MC-Unique: ajLYa_a9P0-2OImcpS90mA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h5-20020a5d6885000000b0015e21e37523so786890wru.10
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=w2f/Fqt8HJW/atFOMp22PMAtjCEBVV+v6wZhUEJwc+M=;
 b=7huEO5yGeaKmQmL2wjudn6nzW+VwfGa9SoOM3Or6K1pj4YbFj3nypCpKjDFqkAynAF
 4U6NK97a3ciRV9HzAi9L1xRAfvJg25nu+NdjjHo9EDZVKkV7yBZuVXZPFyOhaPF+WTPu
 VMmwvVLhq/bml5eEDubhdqKaMF1pkv++ZgSou65L7PwzcldZeuonGPi+pTYYb35pZSZD
 Tm/WriUIMvU4oIwsS5yrogfNMwKYgBKZGYropatHI9CDbNhJxiLKXokJ3DLEmHQ7I23z
 LKTQWt2b/t0zH80jFLMilEsjoiasxU7NHQbNhVnjLpPD1LSZ69Bbj64OXduWVxekhtjy
 4X9g==
X-Gm-Message-State: AOAM5325Uonka4nZQ4nDmplx7yiPF1Ulbee0M98yLrsgQgjM0UC4zrpp
 37bkhr4HnRGfG50hbiyMhoc/jdYXMeTXNhluVeG1RvSZwmitRls+I3y1ARxsquCDeZaA49BC/oo
 oxpcaV6N8bVMqPts=
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr262569wrt.209.1631640012214;
 Tue, 14 Sep 2021 10:20:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUMFv87EgYEw5KSz8qViiXA4pgAlvE88R3MqVkoZzvYD0ovRtJGlkjlnZLHeD0LpA/KUIt4w==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr262550wrt.209.1631640012031;
 Tue, 14 Sep 2021 10:20:12 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id i2sm6873789wrq.78.2021.09.14.10.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:20:11 -0700 (PDT)
Subject: Re: [PATCH v4 05/12] job: @force parameter for job_cancel_sync()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210907124245.143492-1-hreitz@redhat.com>
 <20210907124245.143492-6-hreitz@redhat.com>
 <7ed34792-cdb0-ce82-33d4-07a37348d3dc@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <2c374f18-a38a-a248-8cb9-4a9f7d0d8d3a@redhat.com>
Date: Tue, 14 Sep 2021 19:20:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7ed34792-cdb0-ce82-33d4-07a37348d3dc@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.09.21 18:33, Vladimir Sementsov-Ogievskiy wrote:
> 07.09.2021 15:42, Hanna Reitz wrote:
>> Callers should be able to specify whether they want job_cancel_sync() to
>> force-cancel the job or not.
>>
>> In fact, almost all invocations do not care about consistency of the
>> result and just want the job to terminate as soon as possible, so they
>> should pass force=true.  The replication block driver is the exception,
>> specifically the active commit job it runs.
>>
>> As for job_cancel_sync_all(), all callers want it to force-cancel all
>> jobs, because that is the point of it: To cancel all remaining jobs as
>> quickly as possible (generally on process termination).  So make it
>> invoke job_cancel_sync() with force=true.
>>
>> This changes some iotest outputs, because quitting qemu while a mirror
>> job is active will now lead to it being cancelled instead of completed,
>> which is what we want.  (Cancelling a READY mirror job with force=false
>> may take an indefinite amount of time, which we do not want when
>> quitting.  If users want consistent results, they must have all jobs be
>> done before they quit qemu.)
>>
>> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/462
>> Signed-off-by: Hanna Reitz<hreitz@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks!

Do you plan on taking this series or should I?

Hanna


