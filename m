Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02682ACF97
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 07:23:50 +0100 (CET)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcN4H-0003fQ-Ua
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 01:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcN36-0002mP-GJ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:22:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcN33-0005MZ-Io
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604989350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZNC6tBS0erAJpm/qtUTn5BuWTSpmuPszjc3JM/DLUEc=;
 b=Zkf6MPJDdZqYwEOHv8CD9O1+ONA070D1FUL+/WzuPbVjGwNcM1TQjYZVJZRa2Z+R6au36a
 da/7FG4P+KTuqi0I5e39Ug/QXRneulI56P/F1VfMJ5EKdk67oXkJ61xNCTD+ihgIQNOmvX
 o4zIMcSZaafi1RU1oOrZSqjyNuc2BYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-5QRpO0uUMKqftprplNNOKQ-1; Tue, 10 Nov 2020 01:22:28 -0500
X-MC-Unique: 5QRpO0uUMKqftprplNNOKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9D6C1868426
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 06:22:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C91B60BFA;
 Tue, 10 Nov 2020 06:22:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0B1A81132BD6; Tue, 10 Nov 2020 07:22:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: QMP and the 'id' parameter
References: <62700620-5228-f1cc-f0df-751c0d9f1f82@redhat.com>
Date: Tue, 10 Nov 2020 07:22:26 +0100
In-Reply-To: <62700620-5228-f1cc-f0df-751c0d9f1f82@redhat.com> (John Snow's
 message of "Mon, 9 Nov 2020 20:47:45 -0500")
Message-ID: <87361h20kd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> The QMP specification states:
>
>> NOTE: Some errors can occur before the Server is able to read the "id"
>> member, in these cases the "id" member will not be part of the error
>> response, even if provided by the client.
>
> I am assuming this case ONLY occurs for Parse errors:
>
> {'class': 'GenericError', 'desc': 'JSON parse error, expecting value'}

There are more "desc" possible, actually.

The JSON parser gets fed chunks of input, and calls a callback for every
full JSON value, and on parse error.

QMP's callback is handle_qmp_command().  Parameter @req is the parsed
JSON value, parameter @err is the (parse) error object, and exactly one
of them is non-null.

1. Parse error

If @err, we send an error response for it.  It never has "id".  See
qmp_error_response() caller monitor_qmp_dispatcher_co().  The possible
@err are:

    $ grep error_setg qobject/json-*[ch]
    qobject/json-parser.c:    error_setg(&ctxt->err, "JSON parse error, %s", message);

This is a syntax error.

Search for parse_error() to see the possible @message patterns.

    qobject/json-streamer.c:        error_setg(&err, "JSON parse error, stray '%s'", input->str);

This is a lexical error.

    qobject/json-streamer.c:        error_setg(&err, "JSON token size limit exceeded");
    qobject/json-streamer.c:        error_setg(&err, "JSON token count limit exceeded");
    qobject/json-streamer.c:        error_setg(&err, "JSON nesting depth limit exceeded");

These are (intentional) parser limits.

2. Successful parse

If @req, it's a successful parse.

If @req is not a JSON object, there is no "id".  qmp_dispatch() reports

        error_setg(&err, "QMP input must be a JSON object");

If @req is a JSON object, it has "id" exactly when the client supplied
one.  The response mirrors @req's "id".  See qmp_error_response() caller
qmp_dispatch().

> And I am assuming, in the context of a client that /always/ sets an
> 'id' for its execute statements, that this means that any error
> response we receive without an 'id' field *must* be associated with
> the most-recently-sent command.

Only if the client keeps no more than one command in flight.

Command responses get sent strictly in order (even parse errors), except
for commands executed out-of-band.

If the client sends N JSON values, and only then reads responses, and
there are no parse errors, then it'll get N responses.  The i-th
response is for the i-th JSON value, except responses to OOB command may
"jump the queue".

With parse errors, it can get a different number of responses.

Questions?


