Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75D3F17A5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 13:04:08 +0200 (CEST)
Received: from localhost ([::1]:36138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGfqB-0002ha-3Z
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 07:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGfnY-00019B-HV
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:01:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGfnP-0000ou-FH
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:01:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629370865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMWGNlXcn7YcGUXkGnsTBwwJu7qeCGEgUIo9WBH6fsk=;
 b=TtI1Uz0YvAsGvIlNQWVnapHtklT0GN/cYE93HZr6Wvfvec2EQzHFyp37kCsvcHmUVr5rzY
 Rn4OPmDed+TQdGCcrxWKPl2AjpLkagMpTEiHCbQZmf8sevmdOFWjxGUKk5BvktkfJUxGVJ
 otE7xEiOSCVp8OtkyDtRcoMCxpS5QmE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-c5odjb-7NQaqC-AaMr0Jlg-1; Thu, 19 Aug 2021 07:01:02 -0400
X-MC-Unique: c5odjb-7NQaqC-AaMr0Jlg-1
Received: by mail-wr1-f72.google.com with SMTP id
 y12-20020adfee0c0000b0290154e82fef34so1577431wrn.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 04:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iMWGNlXcn7YcGUXkGnsTBwwJu7qeCGEgUIo9WBH6fsk=;
 b=HdhXdujdMn4Q5OH0LenaRsTJALQN32lb5povlDJusXwJieOlxtoO2TX9UY7LdOz1lT
 hTAhv5kTjOVbj99x5x6oK/VRerFzl2xOYHOsZFVEQwIpxYbgz2QCiGJZu0KBDVYQchd7
 oJbYHXoFzs2YvRp01BT3ZWdG++S7zwd6B1FJOd0bvSX/v6hbnUm4hMydmXt5DLJy5SC5
 F4hggnm7wRKTzZwYJl0qZtIRgZfqE7hqQndwDGeWNhwP6uqgeTVaBAzXBLGAuI7eczXU
 MKbin+3ry/DmY8m2OyLumqwoIIQHdi5McW4nPWekLkrAJnAGNe+NhkSi35ll0mey/S2/
 2X0w==
X-Gm-Message-State: AOAM531mxS5WB84NLnhg+Br3/eVxz/mxHM7XUGQ4/sSnOJIuSleBo/y+
 DYHIHkUUaGXEm/BYxYD7rVYj3pc5brJi6OR5WBu8ZmfVRw0mfHg3OtXz1KwCiT4T/7nyTLtbu1a
 2fK8w1p5+itR+hUA=
X-Received: by 2002:a05:600c:294:: with SMTP id
 20mr13300334wmk.133.1629370860948; 
 Thu, 19 Aug 2021 04:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIiTKcYLVYfwy+bKH7mEVlNTDnn6U/B4nYnuo5H906MkgSwY6XwIKVhI/HQZXGBYvmF5m45A==
X-Received: by 2002:a05:600c:294:: with SMTP id
 20mr13300310wmk.133.1629370860719; 
 Thu, 19 Aug 2021 04:01:00 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 k17sm2807804wrn.8.2021.08.19.04.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 04:01:00 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210819102501.69638-1-hreitz@redhat.com>
 <155c4025-cac0-b4e2-ac4c-f0f36dff2398@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <3d934aad-1676-19cf-ec8f-b3991efd6893@redhat.com>
Date: Thu, 19 Aug 2021 13:00:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <155c4025-cac0-b4e2-ac4c-f0f36dff2398@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.08.21 12:37, Philippe Mathieu-Daudé wrote:
> On 8/19/21 12:25 PM, Hanna Reitz wrote:
>> This post explains when FUSE block exports are useful, how they work,
>> and that it is fun to export an image file on its own path so it looks
>> like your image file (in whatever format it was) is a raw image now.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>> You can also find this patch here:
>> https://gitlab.com/hreitz/qemu-web fuse-blkexport-v1
>>
>> My first patch to qemu-web, so I hope I am not doing anything overly
>> stupid here (adding SVGs with extremely long lines comes to mind)...
> GitLab allows Mermaid and PlantUML diagrams in all tiers products:
>
> https://docs.gitlab.com/ee/user/markdown.html#diagrams-and-flowcharts
> https://about.gitlab.com/handbook/markdown-guide/#diagrams
>
> I find the mermaid live editor easy to use:
> https://mermaid-js.github.io/mermaid-live-editor/
>
> (I looked at that recently because I'd like the pages job to
>   generate QOM dependencies tree).

Interesting, but it does seem limiting, so unless adding SVG graphs is 
unacceptable, I’d rather avoid it, to be honest...

Hanna


