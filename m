Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3B83370C4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:03:18 +0100 (CET)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJ65-0006I0-Ga
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKJ3I-00052F-D1
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:00:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKJ3F-0005VD-Mm
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615460420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faj/K7cpSjG8MeOBJq1qGGpXHazui4f2EpzqqRk/H0c=;
 b=jQA5V9BI2oGiY7vMHtNIp1btcYYTsi2drx/KXIkBfGq4fN73wGQVuHN+9B7sT/8BKcBojo
 psTZSHXdAsZc4GdUpnFuMnHL0ZqPZz1gNDrT0jwGMf+rIDtpjtNrlOpbUNbxZY5p9gTNsr
 N6hvxDZgGM+SCrEVWMDiwTSlaT4RSA4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-osNd8Ns2N8iKxoT88XK48A-1; Thu, 11 Mar 2021 06:00:19 -0500
X-MC-Unique: osNd8Ns2N8iKxoT88XK48A-1
Received: by mail-ed1-f71.google.com with SMTP id bi17so9683231edb.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 03:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=faj/K7cpSjG8MeOBJq1qGGpXHazui4f2EpzqqRk/H0c=;
 b=j6/H/6XBdBsQJuQ33FYf8DxH0U26M6ddd5FdriIT0csOxtPz5D7J5U0tThOpihvAdD
 LgMuBDUl9DBXroPXT5dlB6b5lhXC1+kKCemEaMSdPq27sSSf+3cbTMUfJbqfEZKmb8Wg
 RfRPQ7HKtecQo07qWFZ+XSr1B3v3E4YbRebUzJ3akojQ5m3RALKkBXbODEb3O5+46SaD
 dkcpOZ9K3UUFr0tN21EOgCS1JmoOIjrvxge5z1NgWIfZ2lXFotPU8+wiwF4f91ow+GV1
 1vN8l+tueZJWsrxDwVYAJDooHqN5TNFGwWMkNGyCA5cZIALizmMU1kel5SA5uL8J3Stt
 Ua2Q==
X-Gm-Message-State: AOAM533BqgL2PXCFXA+4EhH8jD9tNUd17am3b1Hs059CfcZe1PqNwdZr
 i4e40/rjfqzf+XmwDiLH5b/ysybSjHrY1o+CKnNK7KBWeCWJsToOOYRejkmcsZbGN3fwj3G9XdQ
 mv/gkKte3wdFw+d0=
X-Received: by 2002:a17:906:dfcc:: with SMTP id
 jt12mr2544003ejc.31.1615460415627; 
 Thu, 11 Mar 2021 03:00:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQBcZGe9nIa7rx8xtEToE1j4wNNHnbWZ33xsLTWUzUMhRboWgFYGnNwAtBW2W2K/UTO62NRA==
X-Received: by 2002:a17:906:dfcc:: with SMTP id
 jt12mr2543850ejc.31.1615460414062; 
 Thu, 11 Mar 2021 03:00:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v22sm1124627ejj.103.2021.03.11.03.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 03:00:13 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box> <87ft12q8kf.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
Message-ID: <e98a5eb7-4716-a0f4-0ad2-adaa4cd9cefa@redhat.com>
Date: Thu, 11 Mar 2021 12:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87ft12q8kf.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, Peter Krempa <pkrempa@redhat.com>,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kraxel@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 11:38, Markus Armbruster wrote:
> Here's a differently terrible hack.  We have
> 
>           keyval_parse()       visitor
>      optarg --------> QObject --------> QAPI type
> 
> Idea: hack the QObject.  If we're working for -object, and QObject maps
> key "qom-type" to value "memory-backend-ram", get the value of
> host-nodes, and if it's a string, parse it into a list like the opts
> visitor does, and put that back, replacing the string value.
> 
> Same for other uses of Memdev and NumaNodeOptions with -object, if they
> exist.

This doesn't help with backwards compatibility, since keyval loses the 
first of host-nodes=0,host-nodes=4.

I would rather keep the OptsVisitor here.  Do the same check for JSON 
syntax that you have in qobject_input_visitor_new_str, and whenever you 
need to walk all -object arguments, use something like this:

     typedef struct ObjectArgument {
         const char *id;
         QDict *json;    /* or NULL for QemuOpts */
         QSIMPLEQ_ENTRY(ObjectArgument) next;
     }

I already had patches in my queue to store -object in a GSList of 
dictionaries, changing it to use the above is easy enough.

Paolo


