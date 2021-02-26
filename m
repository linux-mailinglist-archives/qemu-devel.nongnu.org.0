Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A96F3269DC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 23:19:49 +0100 (CET)
Received: from localhost ([::1]:51782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFlSe-0000dE-4o
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 17:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFlQi-0008CI-Bn
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 17:17:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFlQb-0002hT-6C
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 17:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614377859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BIFVd8l1HBIHk9ckp4RUDhOl/bBQ3ro4KvpdWrLbxpk=;
 b=i/cPluCAjPQysN7W/py2kVqLlW4QL34K0L1/w+E5BdM9xmB+FvKXSyGtC8XpNw+4xLeONN
 AYi7bodIxrpSfuVJAua3/4wq7w3DW7WzDFozX/+JrYCjZBjdcxf9kFwrfoYoLPc+g4bxDt
 E+xEiSluvFBC+46Jcpmb6uAuuUOvmMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-p5tL7vVpNfqPok9ny2N6mw-1; Fri, 26 Feb 2021 17:17:34 -0500
X-MC-Unique: p5tL7vVpNfqPok9ny2N6mw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1415107ACC7;
 Fri, 26 Feb 2021 22:17:33 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B792218AAB;
 Fri, 26 Feb 2021 22:17:25 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-26-kwolf@redhat.com>
 <d4b18317-89e0-cfb1-d9a2-046e94f5d8f7@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 25/31] qemu-img: Use user_creatable_process_cmdline()
 for --object
Message-ID: <d0bec2d3-ee92-a3c8-d39a-c2569ac433b6@redhat.com>
Date: Fri, 26 Feb 2021 16:17:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d4b18317-89e0-cfb1-d9a2-046e94f5d8f7@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 jasowang@redhat.com, dgilbert@redhat.com, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 3:56 PM, Eric Blake wrote:
> On 2/24/21 7:52 AM, Kevin Wolf wrote:
>> This switches qemu-img from a QemuOpts-based parser for --object to
>> user_creatable_process_cmdline() which uses a keyval parser and enforces
>> the QAPI schema.
>>
>> Apart from being a cleanup, this makes non-scalar properties accessible.
>>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> ---
>>  qemu-img.c | 239 ++++++++---------------------------------------------
>>  1 file changed, 33 insertions(+), 206 deletions(-)
>>
> 
>> @@ -1423,15 +1373,9 @@ static int img_compare(int argc, char **argv)
>>          case 'U':
>>              force_share = true;
>>              break;
>> -        case OPTION_OBJECT: {
>> -            QemuOpts *opts;
>> -            opts = qemu_opts_parse_noisily(&qemu_object_opts,
>> -                                           optarg, true);
>> -            if (!opts) {
>> -                ret = 2;
>> -                goto out4;
> 
> Our exit status here of 2 on failure appears to be intentional (since we
> reserve 0 for identical, 1 for mismatch, >1 for error)...
> 
>> -            }
>> -        }   break;
>> +        case OPTION_OBJECT:
>> +            user_creatable_process_cmdline(optarg);
>> +            break;
> 
> ...but becomes 1 here.  Does that matter?
> 
> /me goes and tests...
> 
> Ouch: with current qemu.git master and none of this series applied:
> 
> $ ./qemu-img compare --object foo,id=x /dev/null /dev/null
> qemu-img: invalid object type: foo
> $ echo $?
> 1

Okay, that didn't do what I expected, but this does:

$ ./qemu-img compare --object foo,id=1 /dev/null /dev/null
qemu-img: Parameter 'id' expects an identifier
Identifiers consist of letters, digits, '-', '.', '_', starting with a
letter.
$ echo $?
2

> $ gdb --args ./qemu-img compare --object foo,id=x /dev/null /dev/null
> (gdb) b qemu_opts_pars
> (gdb) r
> (gdb) fin
> Run till exit from #0  qemu_opts_parse_noisily (
>     list=0x55555578f020 <qemu_object_opts>, params=0x7fffffffd8a8
> "foo,id=x",
>     permit_abbrev=true) at ../util/qemu-option.c:948
> 0x00005555555805f9 in img_compare (argc=5, argv=0x7fffffffd480)
>     at ../qemu-img.c:1428
> 1428	            opts = qemu_opts_parse_noisily(&qemu_object_opts,
> Value returned is $1 = (QemuOpts *) 0x55555583b4b0
> (gdb) p *opts
> $3 = {id = 0x5555557a0d58 <qemu_trace_opts+24> "`\264\203UUU", list = 0x51,

and this may be my confusion with gdb.  Right after 'fin', *opts is not
the same as *$1 (apparently gdb has stopped at a point where the 'opts'
currently in scope is not the opts set by qemu_opts_parse_noisily, but
before the opts in scope has actually been assigned the returned value).

> 
> That looks buggy.  qemu_opts_parse_noisily() is NOT returning NULL, but
> rather a pointer to something garbage (that id pointing to a garbage
> string in the middle of qemu_trace_opts is fishy), and so we've been
> exiting with status 1 in spite of the code.
> 
> Looks like we'll want a separate patch fixing that first.

So I was wrong on when qemu_opts_parse_noisily() returns NULL - it does
NOT reject unknown object names (that was the job of the
qemu_opts_foreach call later), but merely rejects bad/duplicate ids.
Thus this code was indeed giving an exit status of 2 when actually
triggered correctly,

> 
>>          case OPTION_IMAGE_OPTS:
>>              image_opts = true;
>>              break;
>> @@ -1450,13 +1394,6 @@ static int img_compare(int argc, char **argv)
>>      filename1 = argv[optind++];
>>      filename2 = argv[optind++];
>>  
>> -    if (qemu_opts_foreach(&qemu_object_opts,
>> -                          user_creatable_add_opts_foreach,
>> -                          qemu_img_object_print_help, &error_fatal)) {
>> -        ret = 2;
>> -        goto out4;
> 
> Same deal with return value.  Except here we used &error_fatal (which
> forces an exit status of 1 rather than returning), and so never even
> reach the ret=2 code.  Looks like we broke that in commit 334c43e2c3,
> where we used to pass NULL instead of &error_fatal (although that commit
> was in turn fixing another problem).

...and THIS spot is why my original attempt to prove that your code was
causing a regression was seeing an exit status of 1, where I instead
ended up proving that we already regressed.

> 
> The rest of this patch looks fine, although maybe
> user_creatable_process_cmdline() should be given an 'int status'
> parameter for specifying 1 vs. 2 (or any other non-zero value) if we
> intend to fix the status of qemu-img compare failures.  (Thankfully,
> even though qemu-img check also has a variety of documented return
> values other than 1, at least it documented 1 as internal errors and was
> already using 1 for --object failures).
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


