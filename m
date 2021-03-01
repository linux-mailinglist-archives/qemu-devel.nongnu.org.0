Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF4B327BF6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:24:28 +0100 (CET)
Received: from localhost ([::1]:40554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGfj1-0002F5-E0
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGfi4-0001nT-68
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:23:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGfi1-0003Ml-Lb
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614594204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWsrgtt3QEZZRagjFMZyfm4qogeRVotQAaAftomjeow=;
 b=DzVWRwUjbrSQHGbrn+ED2iF4eay8I1K8sFrF5L6AcpvxTk+xQ7Xpotaw1aypR4S4ej0dky
 lLCt/JzFuvYur90Ewd09ANOiOsVthW4oAQDva9g/o8CvYvRmE8aqercvBi1kLjyUMpYEPK
 LdFp4+ep8JFega2EutIwbjysMgEXZ1s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-CRHmCcSfO5ixDkE6qHG94Q-1; Mon, 01 Mar 2021 05:23:21 -0500
X-MC-Unique: CRHmCcSfO5ixDkE6qHG94Q-1
Received: by mail-wr1-f71.google.com with SMTP id b15so7464783wrm.1
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 02:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pWsrgtt3QEZZRagjFMZyfm4qogeRVotQAaAftomjeow=;
 b=aJqFRjv/TMMfdSb9Cr2tCJ0b7CdCOqobGPQzDuNoY6QA7ufQcRwq6xYiJwGX8tEsNz
 dy6ptpLxmFtrfnfGQCWVLev5UGCqj9ZE1ozEDnKyJ7FA+5263rJDf2pxX81Mxpt5EVGa
 5eOywuCw6KJf9vlk58CnY1zBuuodUhooG8WWduelbXJxrQJ1RnHGE9adNs2S2qE63UCG
 RPNWDyiS7a3J3cM//5b1+vbZEBuYwtyLz42IJSRJ3MgRdCLwn+G3a/uywMmjYp690r4m
 JUUBfYFwSNGTwtsnXot5o1c4OtjJauO4nqlFkth0iEfXx05d7JQHOspeXtaaUbyObm3z
 uGDg==
X-Gm-Message-State: AOAM531mCufONudEf0qxacvkenmhlMN7dpKh+6ZhZJtKLld4Tc/3KUXC
 OXlNfi9kVadEp7mt4F35f53WMHW3Ynu0tEiy6lS6knzFpF12394s/0NydK70RZs3eavIu2YvKG3
 dpNWWg1BsEnc5NPwv8ZvUsGccV4+nD+QFgnWw8tsel0buIMGmTa7jb9EUCk4VyUUWG10=
X-Received: by 2002:adf:8b0d:: with SMTP id n13mr16326924wra.94.1614594200160; 
 Mon, 01 Mar 2021 02:23:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyg3vZ9IFS4RzgP4qip+arU9PAN+tWjJDNkrvBpprC0mZYRsfjnCXEiwNZVRyjos7N0Q3HMdA==
X-Received: by 2002:adf:8b0d:: with SMTP id n13mr16326902wra.94.1614594199984; 
 Mon, 01 Mar 2021 02:23:19 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id l8sm9556392wrx.83.2021.03.01.02.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 02:23:19 -0800 (PST)
Subject: Re: [PATCH 08/25] hmp: replace "O" parser with keyval
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-9-pbonzini@redhat.com>
 <87zh0xo0fw.fsf@dusky.pond.sub.org>
 <5473a3ec-8c9a-07f2-f822-87a0a0f25351@redhat.com>
 <87wnurji52.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c344a042-99de-ad78-813b-3463b4d42b18@redhat.com>
Date: Mon, 1 Mar 2021 11:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87wnurji52.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/21 11:14, Markus Armbruster wrote:
> There is no reason to reject those IDs other than spoiling the fun we're
> having with setting traps for our users.
> 
> Since QOM is treating '/' specially in paths, and uses IDs as path
> components, it should reject '/' in IDs.  Same reasoning as for file
> names.

I agree; however I don't think it buys anything to do that in HMP rather 
than further down the call chain, because in the end there are other 
ways to get "anti-social" ids than HMP or the command line.  I commented 
on Kevin's object-add series about this issue.

Paolo

> We already restrict IDs to "letters, digits, '-', '.', '_', starting
> with a letter" in several places, including QemuOpts.  We should do that
> more, not less.
> 
> Permitting arbitrary IDs buys us nothing but trouble.


