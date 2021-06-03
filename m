Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CC0399729
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:43:40 +0200 (CEST)
Received: from localhost ([::1]:40168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lobSW-0000oo-2y
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMZ-0004Cp-Kd
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMX-0004Yx-53
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622680648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHWibOCfgQKqxWoyLi84+DstXN/gMqe7JQBCkazBMAA=;
 b=WGzdEouy9oZUA9kps+fEyg4EgVmf0v4MyrOZUl5dTMv+9dhHwmYYCDVYyi69b0ZGU8cUXD
 l9CakEKeDSbvMEQHDHsOWrFH5qiIQz7MnoWNNQ+8gp+8S2yugMHd/pk0Div7OjG9LDmBA2
 CqVPmNvymxzysmvLf3O8rXYaRhLWIzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-IzWsjS_hP8iz8gAKv-Mkuw-1; Wed, 02 Jun 2021 20:37:25 -0400
X-MC-Unique: IzWsjS_hP8iz8gAKv-Mkuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B230107ACE6;
 Thu,  3 Jun 2021 00:37:24 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BD9310013D6;
 Thu,  3 Jun 2021 00:37:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/19] python/qmp: Add qom script rewrites
Date: Wed,  2 Jun 2021 20:37:04 -0400
Message-Id: <20210603003719.1321369-5-jsnow@redhat.com>
In-Reply-To: <20210603003719.1321369-1-jsnow@redhat.com>
References: <20210603003719.1321369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inspired by qom-set, qom-get, qom-tree and qom-list; combine all four of
those scripts into a single script.

A later addition of qom-fuse as an 'extension' necessitates that some
common features are split out and shared between them.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/qom.py        | 262 ++++++++++++++++++++++++++++++++++
 python/qemu/qmp/qom_common.py | 178 +++++++++++++++++++++++
 2 files changed, 440 insertions(+)
 create mode 100644 python/qemu/qmp/qom.py
 create mode 100644 python/qemu/qmp/qom_common.py

diff --git a/python/qemu/qmp/qom.py b/python/qemu/qmp/qom.py
new file mode 100644
index 00000000000..7fe1448b5d9
--- /dev/null
+++ b/python/qemu/qmp/qom.py
@@ -0,0 +1,262 @@
+"""
+QEMU Object Model testing tools.
+
+usage: qom [-h] {set,get,list,tree} ...
+
+Query and manipulate QOM data
+
+optional arguments:
+  -h, --help           show this help message and exit
+
+QOM commands:
+  {set,get,list,tree}
+    set                Set a QOM property value
+    get                Get a QOM property value
+    list               List QOM properties at a given path
+    tree               Show QOM tree from a given path
+"""
+##
+# Copyright John Snow 2020, for Red Hat, Inc.
+# Copyright IBM, Corp. 2011
+#
+# Authors:
+#  John Snow <jsnow@redhat.com>
+#  Anthony Liguori <aliguori@amazon.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# Based on ./scripts/qmp/qom-[set|get|tree|list]
+##
+
+import argparse
+
+from . import QMPResponseError
+from .qom_common import QOMCommand
+
+
+class QOMSet(QOMCommand):
+    """
+    QOM Command - Set a property to a given value.
+
+    usage: qom-set [-h] [--socket SOCKET] <path>.<property> <value>
+
+    Set a QOM property value
+
+    positional arguments:
+      <path>.<property>     QOM path and property, separated by a period '.'
+      <value>               new QOM property value
+
+    optional arguments:
+      -h, --help            show this help message and exit
+      --socket SOCKET, -s SOCKET
+                            QMP socket path or address (addr:port). May also be
+                            set via QMP_SOCKET environment variable.
+    """
+    name = 'set'
+    help = 'Set a QOM property value'
+
+    @classmethod
+    def configure_parser(cls, parser: argparse.ArgumentParser) -> None:
+        super().configure_parser(parser)
+        cls.add_path_prop_arg(parser)
+        parser.add_argument(
+            'value',
+            metavar='<value>',
+            action='store',
+            help='new QOM property value'
+        )
+
+    def __init__(self, args: argparse.Namespace):
+        super().__init__(args)
+        self.path, self.prop = args.path_prop.rsplit('.', 1)
+        self.value = args.value
+
+    def run(self) -> int:
+        rsp = self.qmp.command(
+            'qom-set',
+            path=self.path,
+            property=self.prop,
+            value=self.value
+        )
+        print(rsp)
+        return 0
+
+
+class QOMGet(QOMCommand):
+    """
+    QOM Command - Get a property's current value.
+
+    usage: qom-get [-h] [--socket SOCKET] <path>.<property>
+
+    Get a QOM property value
+
+    positional arguments:
+      <path>.<property>     QOM path and property, separated by a period '.'
+
+    optional arguments:
+      -h, --help            show this help message and exit
+      --socket SOCKET, -s SOCKET
+                            QMP socket path or address (addr:port). May also be
+                            set via QMP_SOCKET environment variable.
+    """
+    name = 'get'
+    help = 'Get a QOM property value'
+
+    @classmethod
+    def configure_parser(cls, parser: argparse.ArgumentParser) -> None:
+        super().configure_parser(parser)
+        cls.add_path_prop_arg(parser)
+
+    def __init__(self, args: argparse.Namespace):
+        super().__init__(args)
+        try:
+            tmp = args.path_prop.rsplit('.', 1)
+        except ValueError as err:
+            raise ValueError('Invalid format for <path>.<property>') from err
+        self.path = tmp[0]
+        self.prop = tmp[1]
+
+    def run(self) -> int:
+        rsp = self.qmp.command(
+            'qom-get',
+            path=self.path,
+            property=self.prop
+        )
+        if isinstance(rsp, dict):
+            for key, value in rsp.items():
+                print(f"{key}: {value}")
+        else:
+            print(rsp)
+        return 0
+
+
+class QOMList(QOMCommand):
+    """
+    QOM Command - List the properties at a given path.
+
+    usage: qom-list [-h] [--socket SOCKET] <path>
+
+    List QOM properties at a given path
+
+    positional arguments:
+      <path>                QOM path
+
+    optional arguments:
+      -h, --help            show this help message and exit
+      --socket SOCKET, -s SOCKET
+                            QMP socket path or address (addr:port). May also be
+                            set via QMP_SOCKET environment variable.
+    """
+    name = 'list'
+    help = 'List QOM properties at a given path'
+
+    @classmethod
+    def configure_parser(cls, parser: argparse.ArgumentParser) -> None:
+        super().configure_parser(parser)
+        parser.add_argument(
+            'path',
+            metavar='<path>',
+            action='store',
+            help='QOM path',
+        )
+
+    def __init__(self, args: argparse.Namespace):
+        super().__init__(args)
+        self.path = args.path
+
+    def run(self) -> int:
+        rsp = self.qom_list(self.path)
+        for item in rsp:
+            if item.child:
+                print(f"{item.name}/")
+            elif item.link:
+                print(f"@{item.name}/")
+            else:
+                print(item.name)
+        return 0
+
+
+class QOMTree(QOMCommand):
+    """
+    QOM Command - Show the full tree below a given path.
+
+    usage: qom-tree [-h] [--socket SOCKET] [<path>]
+
+    Show QOM tree from a given path
+
+    positional arguments:
+      <path>                QOM path
+
+    optional arguments:
+      -h, --help            show this help message and exit
+      --socket SOCKET, -s SOCKET
+                            QMP socket path or address (addr:port). May also be
+                            set via QMP_SOCKET environment variable.
+    """
+    name = 'tree'
+    help = 'Show QOM tree from a given path'
+
+    @classmethod
+    def configure_parser(cls, parser: argparse.ArgumentParser) -> None:
+        super().configure_parser(parser)
+        parser.add_argument(
+            'path',
+            metavar='<path>',
+            action='store',
+            help='QOM path',
+            nargs='?',
+            default='/'
+        )
+
+    def __init__(self, args: argparse.Namespace):
+        super().__init__(args)
+        self.path = args.path
+
+    def _list_node(self, path: str) -> None:
+        print(path)
+        items = self.qom_list(path)
+        for item in items:
+            if item.child:
+                continue
+            try:
+                rsp = self.qmp.command('qom-get', path=path,
+                                       property=item.name)
+                print(f"  {item.name}: {rsp} ({item.type})")
+            except QMPResponseError as err:
+                print(f"  {item.name}: <EXCEPTION: {err!s}> ({item.type})")
+        print('')
+        for item in items:
+            if not item.child:
+                continue
+            if path == '/':
+                path = ''
+            self._list_node(f"{path}/{item.name}")
+
+    def run(self) -> int:
+        self._list_node(self.path)
+        return 0
+
+
+def main() -> int:
+    """QOM script main entry point."""
+    parser = argparse.ArgumentParser(
+        description='Query and manipulate QOM data'
+    )
+    subparsers = parser.add_subparsers(
+        title='QOM commands',
+        dest='command'
+    )
+
+    for command in QOMCommand.__subclasses__():
+        command.register(subparsers)
+
+    args = parser.parse_args()
+
+    if args.command is None:
+        parser.error('Command not specified.')
+        return 1
+
+    cmd_class = args.cmd_class
+    assert isinstance(cmd_class, type(QOMCommand))
+    return cmd_class.command_runner(args)
diff --git a/python/qemu/qmp/qom_common.py b/python/qemu/qmp/qom_common.py
new file mode 100644
index 00000000000..f82b16772df
--- /dev/null
+++ b/python/qemu/qmp/qom_common.py
@@ -0,0 +1,178 @@
+"""
+QOM Command abstractions.
+"""
+##
+# Copyright John Snow 2020, for Red Hat, Inc.
+# Copyright IBM, Corp. 2011
+#
+# Authors:
+#  John Snow <jsnow@redhat.com>
+#  Anthony Liguori <aliguori@amazon.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# Based on ./scripts/qmp/qom-[set|get|tree|list]
+##
+
+import argparse
+import os
+import sys
+from typing import (
+    Any,
+    Dict,
+    List,
+    Optional,
+    Type,
+    TypeVar,
+)
+
+from . import QEMUMonitorProtocol, QMPError
+
+
+# The following is needed only for a type alias.
+Subparsers = argparse._SubParsersAction  # pylint: disable=protected-access
+
+
+class ObjectPropertyInfo:
+    """
+    Represents the return type from e.g. qom-list.
+    """
+    def __init__(self, name: str, type_: str,
+                 description: Optional[str] = None,
+                 default_value: Optional[object] = None):
+        self.name = name
+        self.type = type_
+        self.description = description
+        self.default_value = default_value
+
+    @classmethod
+    def make(cls, value: Dict[str, Any]) -> 'ObjectPropertyInfo':
+        """
+        Build an ObjectPropertyInfo from a Dict with an unknown shape.
+        """
+        assert value.keys() >= {'name', 'type'}
+        assert value.keys() <= {'name', 'type', 'description', 'default-value'}
+        return cls(value['name'], value['type'],
+                   value.get('description'),
+                   value.get('default-value'))
+
+    @property
+    def child(self) -> bool:
+        """Is this property a child property?"""
+        return self.type.startswith('child<')
+
+    @property
+    def link(self) -> bool:
+        """Is this property a link property?"""
+        return self.type.startswith('link<')
+
+
+CommandT = TypeVar('CommandT', bound='QOMCommand')
+
+
+class QOMCommand:
+    """
+    Represents a QOM sub-command.
+
+    :param args: Parsed arguments, as returned from parser.parse_args.
+    """
+    name: str
+    help: str
+
+    def __init__(self, args: argparse.Namespace):
+        if args.socket is None:
+            raise QMPError("No QMP socket path or address given")
+        self.qmp = QEMUMonitorProtocol(
+            QEMUMonitorProtocol.parse_address(args.socket)
+        )
+        self.qmp.connect()
+
+    @classmethod
+    def register(cls, subparsers: Subparsers) -> None:
+        """
+        Register this command with the argument parser.
+
+        :param subparsers: argparse subparsers object, from "add_subparsers".
+        """
+        subparser = subparsers.add_parser(cls.name, help=cls.help,
+                                          description=cls.help)
+        cls.configure_parser(subparser)
+
+    @classmethod
+    def configure_parser(cls, parser: argparse.ArgumentParser) -> None:
+        """
+        Configure a parser with this command's arguments.
+
+        :param parser: argparse parser or subparser object.
+        """
+        default_path = os.environ.get('QMP_SOCKET')
+        parser.add_argument(
+            '--socket', '-s',
+            dest='socket',
+            action='store',
+            help='QMP socket path or address (addr:port).'
+            ' May also be set via QMP_SOCKET environment variable.',
+            default=default_path
+        )
+        parser.set_defaults(cmd_class=cls)
+
+    @classmethod
+    def add_path_prop_arg(cls, parser: argparse.ArgumentParser) -> None:
+        """
+        Add the <path>.<proptery> positional argument to this command.
+
+        :param parser: The parser to add the argument to.
+        """
+        parser.add_argument(
+            'path_prop',
+            metavar='<path>.<property>',
+            action='store',
+            help="QOM path and property, separated by a period '.'"
+        )
+
+    def run(self) -> int:
+        """
+        Run this command.
+
+        :return: 0 on success, 1 otherwise.
+        """
+        raise NotImplementedError
+
+    def qom_list(self, path: str) -> List[ObjectPropertyInfo]:
+        """
+        :return: a strongly typed list from the 'qom-list' command.
+        """
+        rsp = self.qmp.command('qom-list', path=path)
+        # qom-list returns List[ObjectPropertyInfo]
+        assert isinstance(rsp, list)
+        return [ObjectPropertyInfo.make(x) for x in rsp]
+
+    @classmethod
+    def command_runner(
+            cls: Type[CommandT],
+            args: argparse.Namespace
+    ) -> int:
+        """
+        Run a fully-parsed subcommand, with error-handling for the CLI.
+
+        :return: The return code from `.run()`.
+        """
+        try:
+            cmd = cls(args)
+            return cmd.run()
+        except QMPError as err:
+            print(f"{type(err).__name__}: {err!s}", file=sys.stderr)
+            return -1
+
+    @classmethod
+    def entry_point(cls) -> int:
+        """
+        Build this command's parser, parse arguments, and run the command.
+
+        :return: `run`'s return code.
+        """
+        parser = argparse.ArgumentParser(description=cls.help)
+        cls.configure_parser(parser)
+        args = parser.parse_args()
+        return cls.command_runner(args)
-- 
2.31.1


