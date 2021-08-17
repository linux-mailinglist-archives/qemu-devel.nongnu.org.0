Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A463EE733
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 09:28:11 +0200 (CEST)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFtW6-0006Bc-EL
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 03:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFtU3-0003Y1-1R
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFtU1-0002zt-Mw
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629185160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gh5AGTgqltMsAaXtL1tirg3uBseXDjWOJFl2FFZM1sc=;
 b=MsgZf6zqnQf2wkXvlYCha8mCHtebeMwTtdBQE6wmrkn1DabatId4p4jWNYFYt1TNvX1Tht
 eqlJBsllks9OmMpF5NIJNArGvYAPorqn4FPS+O7IGM1WXKGnnGOu63rMY9z3QlqDOdxEsW
 OfEcF1hQyM+uO01Vg+7XlMRvtN/B8o0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-VKErzJblNlObzdkhO0T45A-1; Tue, 17 Aug 2021 03:25:59 -0400
X-MC-Unique: VKErzJblNlObzdkhO0T45A-1
Received: by mail-wm1-f72.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so580223wmr.9
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 00:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Gh5AGTgqltMsAaXtL1tirg3uBseXDjWOJFl2FFZM1sc=;
 b=deuEP9amvnCcSQyt138P2QB6JFHMdqazQC80a0WKNVXWPgiwh4nJJ9/EYvXFfBFLVC
 DKYl/Bg8QjxL/rqz4L9cgwSS7QUvDSFehlDVn7D4fM5IjM6JEba7ucpaXnMjLTpwz8Hs
 YnYq0QQBRsOSeXK8UDN5lKy9W5VBYP96FYbbdHWzY0BQcnMdyv+QfUWe2NaEvaOfDmB5
 1xS4uqdnqUgiKFATX9ZbzJgR4rDYPsWvuAnxyzfVP1yUTonL2M3pPT7jTMH286nTmKIK
 G3O0zWNhtwg8MY4gN47N1sPZ3yX2cPVIqWWcBR7RKRk+q5ZyDJqvrH2Muj79UdfIPWmy
 TRNA==
X-Gm-Message-State: AOAM533W6KyvXGLT/ekabw+2zvjYLe9hdUOlhETfxN8aqlDj/rnPTbZF
 A8kT77U91GdNhkKbLvGbHhnjzPtKAHbaohepYBXXJW8KFSY/nf8hqsIE1Ep+nlvKlBX9q7Yfi32
 dceta5+k1LOoC4qI=
X-Received: by 2002:adf:eb4a:: with SMTP id u10mr2205683wrn.11.1629185157737; 
 Tue, 17 Aug 2021 00:25:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBI1+fyClY1CLrFaY405OGcbBOD/yF+giOKU1+pXa2TrbGhKA/QC7t9imMTtvBrkUd5F2jtw==
X-Received: by 2002:adf:eb4a:: with SMTP id u10mr2205673wrn.11.1629185157602; 
 Tue, 17 Aug 2021 00:25:57 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c65c6.dip0.t-ipconnect.de. [91.12.101.198])
 by smtp.gmail.com with ESMTPSA id n13sm1186864wmc.18.2021.08.17.00.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 00:25:57 -0700 (PDT)
Subject: Re: [PATCH RESEND 2/2] memory: Add tracepoint for dirty sync
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210817013553.30584-1-peterx@redhat.com>
 <20210817013706.30986-1-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <43b42f6e-f2a2-6341-0c53-bcf1586fb191@redhat.com>
Date: Tue, 17 Aug 2021 09:25:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817013706.30986-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.08.21 03:37, Peter Xu wrote:
> Trace at memory_region_sync_dirty_bitmap() for log_sync() or global_log_sync()
> on memory regions.  One trace line should suffice when it finishes, so as to
> estimate the time used for each log sync process.

I wonder if a start/finish would be even nicer. At least it wouldn't 
really result in significantly more code changes :)

-- 
Thanks,

David / dhildenb


