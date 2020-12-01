Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A42CA6DD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:21:28 +0100 (CET)
Received: from localhost ([::1]:55922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7T5-0005ks-Lv
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:21:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kk7Pe-0002xB-0h
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:17:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kk7Pb-0002lw-9B
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606835870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/aBSNGJshMZX1B8DrUu60pRFXkg5Bdg69zGyzQhLy+Q=;
 b=Wqcc0phct4xMCRYKXaPpmGivghTwmB1WExYBV9oScZTZwIzvCvQa0H6fn0LWYzpAH6T3Xa
 yG3aXZCNCChuZOJnOH/3XtKM76HLQgJvKOm9Y69CjVcPmg8VwyoPnaQcflPUqNx9FoMaLo
 P+jisb6baVKZ60WgMf/E8v6H1xFRN1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-2fNryRRRN1mU5M_BGW5Nlg-1; Tue, 01 Dec 2020 10:17:46 -0500
X-MC-Unique: 2fNryRRRN1mU5M_BGW5Nlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86025185E493;
 Tue,  1 Dec 2020 15:17:44 +0000 (UTC)
Received: from [10.10.119.122] (ovpn-119-122.rdu2.redhat.com [10.10.119.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0B5F100AE2C;
 Tue,  1 Dec 2020 15:17:43 +0000 (UTC)
Subject: Re: [PATCH] qmp-shell: Sort by key when pretty-printing
To: David Edmondson <dme@dme.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201013141414.18398-1-david.edmondson@oracle.com>
 <27cc8383-89e1-5c5f-d8cf-7463810c1fd2@redhat.com>
 <cunsg8qjyo7.fsf@zarquon.hh.sledj.net>
From: John Snow <jsnow@redhat.com>
Message-ID: <5be40bd1-8983-aaee-73b0-07f6f35282c5@redhat.com>
Date: Tue, 1 Dec 2020 10:17:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <cunsg8qjyo7.fsf@zarquon.hh.sledj.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 4:57 PM, David Edmondson wrote:
> On Monday, 2020-11-30 at 15:56:51 -05, John Snow wrote:
> 
>> On 10/13/20 10:14 AM, David Edmondson wrote:
>>> If the user selects pretty-printing (-p) the contents of any
>>> dictionaries in the output are sorted by key.
>>>
>>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>>> ---
>>>    scripts/qmp/qmp-shell | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
>>> index c5eef06f3f..b4d06096ab 100755
>>> --- a/scripts/qmp/qmp-shell
>>> +++ b/scripts/qmp/qmp-shell
>>> @@ -260,7 +260,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>>>            indent = None
>>>            if self._pretty:
>>>                indent = 4
>>> -        jsobj = json.dumps(qmp, indent=indent)
>>> +        jsobj = json.dumps(qmp, indent=indent, sort_keys=self._pretty)
>>>            print(str(jsobj))
>>>    
>>>        def _execute_cmd(self, cmdline):
>>>
>>
>> Hi, out of curiosity, what does this help you accomplish?
> 
> When dumping a dictionary with many values, visually finding a specific
> one that is of interest is much quicker if they are sorted. Nothing more
> than that.
> 

Okay, simple! thanks for the input.

If you ever have any other laundry list desires or feedback for 
qmp-shell, let me know, as I intend to overhaul it soon.

(I may turn it into a GSoC project, too.)

--js


