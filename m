Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F29E456C5C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:30:39 +0100 (CET)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0EA-00088A-K1
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:30:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mo0Bl-0004mE-Gu
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:28:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mo0Bj-0007KF-QB
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637314087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKy5ZaJu1nfCFu8FDsXuYuIHwY4f7uM8rNjfYzVBDWY=;
 b=WDFRz0Ir7UnIh9SVzgED/fdv8sLhNguzp5W0okF3Qfsnq7YiLHGV9EAoE/DiVIk8k54QA3
 la+/1G8/JpPJA6831X5oAip2lYZyqyjJ5+2VnmDiU1bRyroPIRQpbB+Gzehs21aISofFjU
 KHFpNvQp/uXculJjP/xL9U8ql8eLKnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-ZdhTrk02NcmjffjAHQ1-ag-1; Fri, 19 Nov 2021 04:28:03 -0500
X-MC-Unique: ZdhTrk02NcmjffjAHQ1-ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFD521023F4D;
 Fri, 19 Nov 2021 09:28:02 +0000 (UTC)
Received: from [10.39.194.192] (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08D3B19D9B;
 Fri, 19 Nov 2021 09:27:58 +0000 (UTC)
Message-ID: <cc793f13-fb5c-f075-3839-e603d727b557@redhat.com>
Date: Fri, 19 Nov 2021 10:27:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Chardev: delete the QemuOpts reserved in vm_config_groups
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?44G36aOO6L+H5peg55eVPz8=?= <787738581@qq.com>
References: <tencent_C7CEA36B3AB3971A278DFD71F2BBCFF88906@qq.com>
 <CAMxuvaw1+x0FmG_0aW2YCL2pUPFuO=VC=0nv0QA43MkKnMM7fQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMxuvaw1+x0FmG_0aW2YCL2pUPFuO=VC=0nv0QA43MkKnMM7fQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 09:46, Marc-André Lureau wrote:
>> +   QemuOpts *opts;
>>
>>       chr = qemu_chr_find(id);
>>       if (chr == NULL) {
>> @@ -1175,6 +1177,10 @@ void qmp_chardev_remove(const char *id, Error **errp)
>>           return;
>>       }
>>       object_unparent(OBJECT(chr));
>> +    /* delete the opts reserved in vm_config_groups list.  */
>> +    opts = qemu_opts_find(qemu_find_opts("chardev"), id);
>> +    if (opts)
>> +        qemu_opts_del(opts);
> That seems reasonable to me,
> Reviewed-by: Marc-André Lureau<marcandre.lureau@redhat.com>

I think it should be done instead in an unparent function, i.e. with 
something like "oc->unparent = chr_unparent;" in char_class_init. 
chr_unparent does the qemu_opts_find/qemu_opts_del.

Thanks,

Paolo


