Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2619B4C1A41
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 18:53:03 +0100 (CET)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMvoz-0004HK-D4
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 12:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMvmk-0003Mk-VO
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 12:50:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMvmh-00087b-5t
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 12:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645638634;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5jGTYNSXOCq4CE1enF/iv/YJCBaFV9teD3yyV+LOjA=;
 b=YtTsfuo6ZNE7lEIb/GDXmqO19zMCdUIJbo/oTHGqKngkzgnLiEXe015joW0Im0MuA41cqI
 aVhaklJPOp4XsnrciiRYhFyfJErtHwPp64ku9GEgG/pQD4sethizwDeOo7Q+UoBoJpNBN0
 ftQKKyD6ztlfP/wHZuW3MXFc9ekwC54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-IkjWXgs6MxGjdYyhZQMOXA-1; Wed, 23 Feb 2022 12:50:26 -0500
X-MC-Unique: IkjWXgs6MxGjdYyhZQMOXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6342F1091DA1;
 Wed, 23 Feb 2022 17:50:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7AB84772;
 Wed, 23 Feb 2022 17:50:08 +0000 (UTC)
Date: Wed, 23 Feb 2022 17:50:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 4/5] python: qmp_shell: add -e/--exit-on-error option
Message-ID: <YhZzzbL6MFhMz7vx@redhat.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <20220221155519.2367-5-damien.hedde@greensocs.com>
 <CAFn=p-ZErejiw7mn_kN6c+57ya4OgS3ANpUa=BtS3Be=vcSOvg@mail.gmail.com>
 <YhZST1fCU54OgoP2@redhat.com>
 <CAFn=p-bo39LEvQhKBZZ6ZcEfhaaZ7eQDgDFMOEZtDkCV_XH54w@mail.gmail.com>
 <YhZWcFY1sGSV/OX8@redhat.com>
 <CAFn=p-aSbkdzqZQAZYKX2mPo9BVmX0U5s+huXQH-JcD5N6+WCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-aSbkdzqZQAZYKX2mPo9BVmX0U5s+huXQH-JcD5N6+WCA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 11:18:26AM -0500, John Snow wrote:
> On Wed, Feb 23, 2022 at 10:44 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Feb 23, 2022 at 10:41:11AM -0500, John Snow wrote:
> > > On Wed, Feb 23, 2022 at 10:27 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > >
> > > > On Wed, Feb 23, 2022 at 10:22:11AM -0500, John Snow wrote:
> > > > > On Mon, Feb 21, 2022 at 10:55 AM Damien Hedde
> > > > > <damien.hedde@greensocs.com> wrote:
> > > > > >
> > > > > > This option makes qmp_shell exit (with error code 1)
> > > > > > as soon as one of the following error occurs:
> > > > > > + command parsing error
> > > > > > + disconnection
> > > > > > + command failure (response is an error)
> > > > > >
> > > > > > _execute_cmd() method now returns None or the response
> > > > > > so that read_exec_command() can do the last check.
> > > > > >
> > > > > > This is meant to be used in combination with an input file
> > > > > > redirection. It allows to store a list of commands
> > > > > > into a file and try to run them by qmp_shell and easily
> > > > > > see if it failed or not.
> > > > > >
> > > > > > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > > > >
> > > > > Based on this patch, it looks like you really want something
> > > > > scriptable, so I think the qemu-send idea that Dan has suggested might
> > > > > be the best way to go. Are you still hoping to use the interactive
> > > > > "short" QMP command format? That might be a bad idea, given how flaky
> > > > > the parsing is -- and how we don't actually have a published standard
> > > > > for that format. We've *never* liked the bad parsing here, so I have a
> > > > > reluctance to use it in more places.
> > > > >
> > > > > I'm having the naive idea that a script file could be as simple as a
> > > > > list of QMP commands to send:
> > > > >
> > > > > [
> > > > >     {"execute": "block-dirty-bitmap-add", "arguments": { ... }},
> > > > >     ...
> > > > > ]
> > > >
> > > > I'd really recommend against creating a new format for the script
> > > > file, especially one needing opening & closing  [] like this, as
> > > > that isn't so amenable to dynamic usage/creation. ie you can't
> > > > just append an extcra command to an existing file.
> > > >
> > > > IMHO, the "file" format should be identical to the result of
> > > > capturing the socket data off the wire. ie just a concatenation
> > > > of QMP commands, with no extra wrapping / change in format.
> > > >
> > >
> > > Eugh. That's just so hard to parse, because there's no off-the-shelf
> > > tooling for "load a sequence of JSON documents". Nothing in Python
> > > does it. :\
> >
> > It isn't that hard if you require each JSON doc to be followed by
> > a newline.
> >
> > Feed one line at a time to the JSON parser, until you get a complete
> > JSON doc, process that, then re-init the parser and carry on feeding
> > it lines until it emits the next JSON doc, and so on.
> >
> 
> There's two interfaces in Python:
> 
> (1) json.load(), which takes a file pointer and either returns a
> single, complete JSON document or it raises an Exception. It's not
> useful here at all.
> (2) json.JSONDecoder().raw_decode(strbuf), which takes a string buffer
> and returns a 2-tuple of a JSON Document and the position at which it
> stopped decoding.

Yes, the latter would do it, but you can also be lazy and just
repeatedly call json.loads() until you get a valid parse

$ cat demo.py
import json

cmds = []
bits = []
with open("qmp.txt", "r") as fh:
    for line in fh:
        bits.append(line)
        try:
            cmdstr = "".join(bits)
            cmds.append(json.loads(cmdstr))
            bits = []
        except json.JSONDecodeError:
            pass


for cmd in cmds:
    print("Command: %s" % cmd)


$ cat qmp.txt
{ "execute": "qmp_capabilities" }
{ "execute": "blockdev-add",
    "arguments": {
        "node-name": "drive0",
        "driver": "file",
        "filename": "$TEST_IMG"
    }
}
{ "execute": "blockdev-add",
    "arguments": {
        "driver": "$IMGFMT",
        "node-name": "drive0-debug",
        "file": {
            "driver": "blkdebug",
            "image": "drive0",
            "inject-error": [{
                "event": "l2_load"
            }]
        }
    }
}
{ "execute": "human-monitor-command",
    "arguments": {
        "command-line": "qemu-io drive0-debug \"read 0 512\""
    }
}
{ "execute": "quit" }


$ python demo.py
Command: {'execute': 'qmp_capabilities'}
Command: {'execute': 'blockdev-add', 'arguments': {'node-name': 'drive0', 'driver': 'file', 'filename': '$TEST_IMG'}}
Command: {'execute': 'blockdev-add', 'arguments': {'driver': '$IMGFMT', 'node-name': 'drive0-debug', 'file': {'driver': 'blkdebug', 'image': 'drive0', 'inject-error': [{'event': 'l2_load'}]}}}
Command: {'execute': 'human-monitor-command', 'arguments': {'command-line': 'qemu-io drive0-debug "read 0 512"'}}
Command: {'execute': 'quit'}


> Wanting to keep the script easy to append to is legitimate. I'm keen
> to hear a bit more about the use case here before I press extremely
> hard in any given direction, but those are my impulses here.

We can see examples of where this could be used in the I/O tests

eg in tests/qemu-iotests/071, a frequent pattern is:

run_qemu <<EOF
{ "execute": "qmp_capabilities" }
{ "execute": "blockdev-add",
    "arguments": {
        "node-name": "drive0",
        "driver": "file",
        "filename": "$TEST_IMG"
    }
}
{ "execute": "blockdev-add",
    "arguments": {
        "driver": "$IMGFMT",
        "node-name": "drive0-debug",
        "file": {
            "driver": "blkdebug",
            "image": "drive0",
            "inject-error": [{
                "event": "l2_load"
            }]
        }
    }
}
{ "execute": "human-monitor-command",
    "arguments": {
        "command-line": 'qemu-io drive0-debug "read 0 512"'
    }
}
{ "execute": "quit" }
EOF


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


