Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C92E1D7005
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 06:58:40 +0200 (CEST)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaXrL-0004B6-EX
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 00:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXps-0003LW-Vf
 for qemu-devel@nongnu.org; Mon, 18 May 2020 00:57:08 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27329
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXps-0002lk-99
 for qemu-devel@nongnu.org; Mon, 18 May 2020 00:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589777827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qp1nG/AnW8vs90mrQ5lquRsB1ruvQg49P9AWsjp4bUo=;
 b=OorEFboODVZ8Amsza+gS070M4sxrRasFGUrnpwwgibBFqW/KqWsPzIrbb6CIl3Ffyn/UTS
 Q2ht2GtDFRI/KfyQgWNAHy5RYVy7svPCu1iaymKwCu/vJqd0hQsikTbP/MFLIxiqV/T6ya
 TIniki7ICJ4vxv4Ilq7aOdm3jv9VhuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-SjkuFJSdOzGtmEMLsjyQuw-1; Mon, 18 May 2020 00:57:05 -0400
X-MC-Unique: SjkuFJSdOzGtmEMLsjyQuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A44C51800D42
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 04:57:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8BCE10013D9;
 Mon, 18 May 2020 04:57:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4B8E311358BC; Mon, 18 May 2020 06:57:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] trace/simple: Fix unauthorized enable
References: <20200515070021.20811-1-armbru@redhat.com>
 <20200515100240.GC355503@stefanha-x1.localdomain>
Date: Mon, 18 May 2020 06:57:00 +0200
In-Reply-To: <20200515100240.GC355503@stefanha-x1.localdomain> (Stefan
 Hajnoczi's message of "Fri, 15 May 2020 11:02:40 +0100")
Message-ID: <875zctkfhf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:52:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Fri, May 15, 2020 at 09:00:21AM +0200, Markus Armbruster wrote:
>> diff --git a/trace/simple.c b/trace/simple.c
>> index fc7106ec49..906391538f 100644
>> --- a/trace/simple.c
>> +++ b/trace/simple.c
>> @@ -302,10 +302,10 @@ static int st_write_event_mapping(void)
>>      return 0;
>>  }
>>  
>> -void st_set_trace_file_enabled(bool enable)
>> +bool st_set_trace_file_enabled(bool enable)
>>  {
>>      if (enable == !!trace_fp) {
>> -        return; /* no change */
>> +        return enable;          /* no change */
>>      }
>>  
>>      /* Halt trace writeout */
>> @@ -323,14 +323,14 @@ void st_set_trace_file_enabled(bool enable)
>>  
>>          trace_fp = fopen(trace_file_name, "wb");
>>          if (!trace_fp) {
>> -            return;
>> +            return !enable;
>>          }
>>  
>>          if (fwrite(&header, sizeof header, 1, trace_fp) != 1 ||
>>              st_write_event_mapping() < 0) {
>>              fclose(trace_fp);
>>              trace_fp = NULL;
>> -            return;
>> +            return !enable;
>>          }
>>  
>>          /* Resume trace writeout */
>> @@ -340,6 +340,7 @@ void st_set_trace_file_enabled(bool enable)
>>          fclose(trace_fp);
>>          trace_fp = NULL;
>>      }
>> +    return !enable;
>>  }
>
> The meaning of the return value confuses me. Is it the previous value
> (even when the function fails)?  Please document the meaning.
>
> The code might be easier to understand like this:
>
>   bool st_set_trace_file_enabled(bool enable)
>   {
>       bool was_enabled = trace_fp;
>
>       if (enable == was_enabled) {
>           return was_enabled;      /* no change */
>       }
>
>       ...
>
>       return was_enabled;
>   }
>
> Now it is not necessary to remember that !enable is the previous value
> because we would have already returned if the value was unchanged.

I'll send v2.  Thanks!


