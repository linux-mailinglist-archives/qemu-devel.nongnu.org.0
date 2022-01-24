Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5140D497A5E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:30:00 +0100 (CET)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBujf-0002jr-3T
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:29:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nBuaz-0005ZI-BR
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 03:21:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nBuav-0005Fr-1H
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 03:20:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643012455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lO4pyMeohUDDO9JjgS3yq+GxckGKtvQRNtC9Yd2Mddo=;
 b=TrJLq0s3J0SQoTvdYcFaxdaQNdy41jVWijP+PQywWExpRlOswUneLb/HxF4ucUDsj6vrEZ
 qi8nAnU+KqVJWwmfEwsp0bMQLnbq95ReWNZiPkUWqYymAY6IIwavr0N728p1cUV1PT9Fop
 U3/gvH6Zxq8+h1NBat+WOeR9QAApdtA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-hh1uzkEnPqqpfsPL8ObntQ-1; Mon, 24 Jan 2022 03:20:53 -0500
X-MC-Unique: hh1uzkEnPqqpfsPL8ObntQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r26-20020adfab5a000000b001d67d50a45cso1530099wrc.18
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 00:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lO4pyMeohUDDO9JjgS3yq+GxckGKtvQRNtC9Yd2Mddo=;
 b=MGgfzI5BQ7hWeMIh+x/K/P+5x5QgpwTr4T/LrhxAu6HCxfbU4zKoF8IFN4FlHRKfjI
 6ZjmcBYVCMkQ7hOMEqUaonMe1b46WQ0Lfm5KmHPsCq12XkLNAyiz8wGBUJSAXwHil3sz
 QTcWYbDge3eZ6XvQxKzLTdrMc8ornaiI0OSV6wU3HbceFLm7JeE4lxqH/Bg9PBcDgnTZ
 DcsaZft+YVgbypGlV0m7JdqIvYBZm1pB1ginQ0U/VvEg4GPtkQKP7XE82h3gLfWarERC
 EZG1nYZOMQl+jxzjufiS/noFhktiPmPbRe648P/RzZA8R1Yz9ChNH93dIaU++PMex8C8
 fwiQ==
X-Gm-Message-State: AOAM5321A7Dv2R+skVp3+TYsMOi7BEwGSpl85UN+Lp0tqoEEe9P2n4D0
 eBAXUd9RGCn2ueJ/nCK0hFKn6XNQ0u120ikYvUVnvJncT3cFf1RleJurMlSOwN+UtVmshG5tOm7
 C07qD9dF6jamscgk=
X-Received: by 2002:a05:600c:2314:: with SMTP id
 20mr759271wmo.191.1643012452428; 
 Mon, 24 Jan 2022 00:20:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyB0ekmNy7LjoJ+eP5IWRKRuz2tYq27BVNBTby16XpZWQ68/m4KMX31r/n/TlQzTd/gSISjvw==
X-Received: by 2002:a05:600c:2314:: with SMTP id
 20mr759253wmo.191.1643012452157; 
 Mon, 24 Jan 2022 00:20:52 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id g4sm15796294wrd.12.2022.01.24.00.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 00:20:51 -0800 (PST)
Message-ID: <87ab613d-3113-a6e2-fd1e-ad2cb861f041@redhat.com>
Date: Mon, 24 Jan 2022 09:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
To: Markus Armbruster <armbru@redhat.com>
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
 <87zgnrubkf.fsf@dusky.pond.sub.org>
 <4a15fbad-b177-f35c-1468-ef14f7ab1887@redhat.com>
 <YehIosxuXCqsGBSW@redhat.com> <87ee5275ya.fsf@dusky.pond.sub.org>
 <ffaf9aee-56e9-c332-09ad-158a3e28758b@redhat.com>
 <87pmol62kv.fsf@dusky.pond.sub.org>
 <f7b6d0e0-ee5f-f7ed-795b-27b13ff816c7@redhat.com>
 <87tudx4c4p.fsf@dusky.pond.sub.org>
 <b2e955f3-2696-5ee3-e8fb-be336e0811c6@redhat.com>
 <87a6fp4138.fsf@dusky.pond.sub.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <87a6fp4138.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 15:26, Markus Armbruster wrote:
> Hanna Reitz <hreitz@redhat.com> writes:
>
>> On 21.01.22 11:27, Markus Armbruster wrote:
>>> Hanna Reitz <hreitz@redhat.com> writes:
>>>> The problem I face is that currently there is no ergonomic way to wait
>>>> until the QSD is up and running (besides looping until the PID file
>>>> exists), and I don’t think a utility program that doesn’t know the QSD
>>>> could provide this.  (For example, it looks like daemonize(1) will
>>>> have the parent exit immediately, regardless of whether the child is
>>>> set up or not.)
>>> Why do you need to wait for QSD to be ready?
>>>
>>> I'm asking because with common daemons, I don't wait, I just connect to
>>> their socket and start talking.  They'll reply only when ready.
>> That only applies when you want to talk to a socket, which I often
>> don’t do.  Most of the time I use the storage daemon, I pass all
>> --blockdev and --export options through the command line and don’t
>>   create any socket at all.  When I use the QSD just to export some
>> block device, I generally don’t need QMP.
> If you export via NBD, why can't you just connect to NBD socket?

I’m not sure what exactly you mean by this, because the socket doesn’t 
exist before the QSD is launched.  If I launch the QSD in the background 
and have it create an NBD server on a Unix socket, then this socket will 
not exist until the respective --nbd-server option is parsed.  Trying to 
connect to it immediately after the QSD has been launched may work (if 
the QSD was quicker to parse the option and create the server than me 
trying to connect) or may yield ECONNREFUSED or ENOENT, depending on 
whether the socket file existed before or not.

Also, outside of the iotests, I personally generally usually use FUSE 
exports instead of NBD exports.


