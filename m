Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48312C8A7A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 18:10:10 +0100 (CET)
Received: from localhost ([::1]:48772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmgj-0007Pe-TW
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 12:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjmcJ-0002Ib-H7
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:05:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjmcE-00079x-Qr
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:05:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606755928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nQhy2f38fWjOhYs01F+4NQE57ym/7dOWJLFt0Ooijjg=;
 b=eR+MAPWnD4UyResNMvpoQLLTosFoW5aTEkNIBoOAeoW+y+cyAiYrTuthagY+7XNGR9zQs+
 vafd2sUj4djc9wcUQuMHbPI6rH90sXu2hp/dtyKSONn/lAj2hBKuQJOrzjPV50PR8IMSKR
 nq5taAN3QUAl3vCIsnIaZ6RWUYOqNVY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-f-4xs8x9OfC_vxBDhypfOQ-1; Mon, 30 Nov 2020 12:05:26 -0500
X-MC-Unique: f-4xs8x9OfC_vxBDhypfOQ-1
Received: by mail-wr1-f70.google.com with SMTP id 91so8543546wrk.17
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 09:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nQhy2f38fWjOhYs01F+4NQE57ym/7dOWJLFt0Ooijjg=;
 b=QVQJ6stUYI/FSsKgyKDAXcmIY2SvsWSY8eoNyJzp62czlo1bZcdWfwaVjj5Sf4lBv+
 wmbpDlBFN1n3fyaBZ3KFgPIhjtjYodyXmaJy/91/W3/Ks3zApC3gsKGB8KFs6+uQtgrJ
 QBNHgOK4OJ1EoHUNCIHhUYSg0BX05UTQDaP5gC0n0QbZXaG1s7KNEryfC0ELL4gLkunq
 FQfmBSveG8ivU4KU802INUW2HdW3W8h5UBjL22KJs6kExT2yBgByU6uspaF7z4reQxLG
 34MdAMAv68QqFpu1j1K29w9nvaQrUuIysffWVdOrvwNofVXug5qsGdakvAvNG/eikyT2
 itrQ==
X-Gm-Message-State: AOAM530EJukBzZOofzwDbi2R2ORY0FiqdBrIfwuCLbdSubQLZrCjvNri
 a7R9rkBR27F+LQ6FqLFKOc4uKT09LAQCbjbTpvqKsomN1G+EyVhBFgZVqZZ/A2qTfFyuTWWQ1AF
 vpzk7jSJOEv2DYOM=
X-Received: by 2002:a05:600c:25c2:: with SMTP id
 2mr8289629wml.170.1606755924836; 
 Mon, 30 Nov 2020 09:05:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTrNdSq2L6pmhViwh09hGTIkjFA3JTGC/LcE4tnC8vs/3v+nlFpKhWyMDVdS2Gp/w2OZN1PA==
X-Received: by 2002:a05:600c:25c2:: with SMTP id
 2mr8289609wml.170.1606755924573; 
 Mon, 30 Nov 2020 09:05:24 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id c81sm9257508wmd.6.2020.11.30.09.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 09:05:23 -0800 (PST)
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
To: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <39660a7e-7992-ebb0-a888-d3bd35cce97f@redhat.com>
Date: Mon, 30 Nov 2020 18:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116131011.26607-2-r.bolshakov@yadro.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 2:10 PM, Roman Bolshakov wrote:
> There's a problem for management applications to determine if certain
> accelerators available. Generic QMP command should help with that.
> 
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  monitor/qmp-cmds.c | 15 +++++++++++++++
>  qapi/machine.json  | 19 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
...
> +##
> +# @query-accel:
> +#
> +# Returns information about an accelerator
> +#
> +# Returns: @KvmInfo
> +#
> +# Since: 6.0.0
> +#
> +# Example:
> +#
> +# -> { "execute": "query-accel", "arguments": { "name": "kvm" } }
> +# <- { "return": { "enabled": true, "present": true } }

FWIW you can use 'qom-list-types' for that:

{ "execute": "qom-list-types", "arguments": { "implements": "accel" } }
{
    "return": [
        {
            "name": "qtest-accel",
            "parent": "accel"
        },
        {
            "name": "tcg-accel",
            "parent": "accel"
        },
        {
            "name": "xen-accel",
            "parent": "accel"
        },
        {
            "name": "kvm-accel",
            "parent": "accel"
        },
        {
            "name": "accel",
            "parent": "object"
        }
    ]
}

Which is what I use for integration tests:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg675079.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg675085.html


