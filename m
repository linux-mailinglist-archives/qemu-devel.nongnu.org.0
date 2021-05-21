Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A2A38C773
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:05:17 +0200 (CEST)
Received: from localhost ([::1]:40434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4q4-0001ff-V4
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lk4o4-0007cO-3z
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:03:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lk4ny-0000wk-Ao
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621602184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uchKa9KlVbdWeORm6vHYi1PIKvZYyJ2i41S+8Zx6VEg=;
 b=Dq6EMpyQj+YO5UaFo+O2aeIIkMmtxoUxsMsmICBxm4l1Umcg5AsIxom1mURhf1tVrvQmbQ
 vuNGILfhH0ILzkZ//u57TlZFUWImWOJzmSNl+wcEDqXn27a3IUqWrrpGojo2+ueoNtcVBq
 oT+Qvkxgvwe2QTcLAFHftHv3oHdk4hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-BsqRXYIvMniwD8QjRPtkaw-1; Fri, 21 May 2021 09:03:03 -0400
X-MC-Unique: BsqRXYIvMniwD8QjRPtkaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2990EA0CAE;
 Fri, 21 May 2021 13:03:02 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-113.ams2.redhat.com [10.36.112.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2910E10027A5;
 Fri, 21 May 2021 13:02:52 +0000 (UTC)
Subject: Re: [PATCH v3 4/6] gitlab-ci: Add ccache in $PATH and display
 statistics
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-5-f4bug@amsat.org>
 <5a77ade3-1a6c-2389-4a1c-2c7c2266f298@redhat.com>
 <20c001a0-60ed-df08-b67d-884022e74d04@amsat.org>
 <396e75d2-fe22-3054-fbee-d6de02339b2a@redhat.com>
 <YKeQkqviHbxqcC6Y@redhat.com>
 <afa421f3-337a-c488-c767-b73aaf3780b8@redhat.com>
 <CAKJDGDYMygQYw4anr1An+TqRYehJ136M-0Yr0Qb2b5Nfff_2mA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a944c080-0580-90e4-705d-938aaf16c0df@redhat.com>
Date: Fri, 21 May 2021 15:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDYMygQYw4anr1An+TqRYehJ136M-0Yr0Qb2b5Nfff_2mA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/2021 14.36, Willian Rampazzo wrote:
> On Fri, May 21, 2021 at 8:03 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 21/05/2021 12.50, Daniel P. Berrangé wrote:
[...]
>>> Is there anything functional holding up your previous full cccache support
>>> series from last month ? Or is it just lack of reviews ?
>>
>> It's basically the problems mentioned in the cover letter and Stefan's
>> comment here:
>>
>>    https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02219.html
>>
>> The series needs more love and more testing, if it's feasible with the
>> gitlab-CI architecture at all to use ccache in a good way ... if we don't
>> get a real speedup by the patches, it's certainly not worth the effort to
>> integrate this...
>>
>> If someone wants to have a try to improve the patch series, your help is
>> certainly welcome - since at least I personally lack the time and motivation
>> to improve this any further.
> 
> Do you mind if I play with your patch series? I do not promise 100% of
> my time working on it, but I was thinking about dedicating some time
> to ccache before your patch series.

I certainly don't mind! If you get it running well enough so that the total 
runtime decreases, that would be really great!

  Thomas


